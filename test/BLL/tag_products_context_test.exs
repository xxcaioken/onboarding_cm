defmodule OnboardingCm.BLL.TagProductsContextTest do
  use OnboardingCm.RepoCase

  alias OnboardingCm.BLL.{TagProductsContext, ProductContext, CollectionContext, TagContext}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(OnboardingCm.Repo)
  end

  describe "gestão de tag_products" do
    test "criando um tag_product válido", %{test: test} do
      IO.puts("=========== Iniciando teste de TagProductsContext ===========")

      IO.puts("#{test}")

      collection_attributes = %{
        name: "Verão 2025",
        year: 2025,
        season: "Verão",
        release_date: ~D[2025-03-15]
      }

      assert collection = CollectionContext.create!(collection_attributes)

      product_attributes = %{
        name: "Blusa Básica",
        description: "Blusa de algodão com corte básico",
        img_url: "https://example.com/blusa.jpg",
        collection_id: collection.id
      }

      assert product = ProductContext.create!(product_attributes)

      tag_attributes = %{
        name: "Tag infantil",
        value: "Publico: infantil",
        description: "Descrição da tag"
      }

      assert tag = TagContext.create!(tag_attributes)

      attrs = %{
        product_id: product.id,
        tag_id: tag.id
      }

      assert tag_product = TagProductsContext.create!(attrs)
      assert tag_product.product_id == product.id
      assert tag_product.tag_id == tag.id
    end

    test "não criar tag_product com dados inválidos", %{test: test} do
      IO.puts("#{test}")

      attrs = %{product_id: nil, tag_id: nil}
      assert {:error, %Ecto.Changeset{}} = TagProductsContext.create(attrs)
    end

    test "listar todas as tag_products", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      product1 =
        ProductContext.create!(%{
          name: "Blusa Básica",
          description: "Blusa de algodão",
          img_url: "https://example.com/blusa.jpg",
          collection_id: collection.id
        })

      product2 =
        ProductContext.create!(%{
          name: "Calça Jeans",
          description: "Calça jeans",
          img_url: "https://example.com/calca.jpg",
          collection_id: collection.id
        })

      tag =
        TagContext.create!(%{
          name: "Tag unificada",
          value: "Publico: unificado",
          description: "Descrição da tag"
        })

      tag_product1 = TagProductsContext.create!(%{product_id: product1.id, tag_id: tag.id})
      tag_product2 = TagProductsContext.create!(%{product_id: product2.id, tag_id: tag.id})

      tag_products = TagProductsContext.list_tag_products()
      assert length(tag_products) == 2
    end

    test "atualizar dados de um tag_product", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      product =
        ProductContext.create!(%{
          name: "Blusa Básica",
          description: "Blusa de algodão",
          img_url: "https://example.com/blusa.jpg",
          collection_id: collection.id
        })

      tag1 =
        TagContext.create!(%{
          name: "Tag original",
          value: "Publico: original",
          description: "Descrição original"
        })

      tag2 =
        TagContext.create!(%{
          name: "Tag atualizada",
          value: "Publico: atualizado",
          description: "Descrição atualizada"
        })

      tag_product = TagProductsContext.create!(%{product_id: product.id, tag_id: tag1.id})

      update_attrs = %{tag_id: tag2.id}

      assert updated = TagProductsContext.update_tag_product!(tag_product, update_attrs)
      assert updated.tag_id == tag2.id
    end

    test "deletar um tag_product", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      product =
        ProductContext.create!(%{
          name: "Blusa Básica",
          description: "Blusa de algodão",
          img_url: "https://example.com/blusa.jpg",
          collection_id: collection.id
        })

      tag =
        TagContext.create!(%{
          name: "Tag deletada",
          value: "Publico: deletado",
          description: "Descrição da tag deletada"
        })

      tag_product = TagProductsContext.create!(%{product_id: product.id, tag_id: tag.id})

      assert _ = TagProductsContext.delete_tag_product!(tag_product)
    end

    test "buscar produtos por tag", %{test: test} do
      IO.puts("#{test}")

      collection =
        CollectionContext.create!(%{
          name: "Verão 2025",
          year: 2025,
          season: "Verão",
          release_date: ~D[2025-03-15]
        })

      product =
        ProductContext.create!(%{
          name: "Blusa Básica",
          description: "Blusa de algodão",
          img_url: "https://example.com/blusa.jpg",
          collection_id: collection.id
        })

      tag =
        TagContext.create!(%{
          name: "Tag buscada",
          value: "Publico: buscado",
          description: "Descrição da tag buscada"
        })

      tag_product = TagProductsContext.create!(%{product_id: product.id, tag_id: tag.id})

      found = TagProductsContext.get_products_by_tag!(tag.id)
      assert found.tag_id == tag.id
      assert found.product_id == product.id
    end
  end
end
