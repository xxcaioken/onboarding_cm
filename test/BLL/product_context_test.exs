defmodule OnboardingCm.BLL.ProductContextTest do
  use OnboardingCm.RepoCase

  alias OnboardingCm.BLL.{ProductContext, CollectionContext}

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(OnboardingCm.Repo)
  end

  describe "gestão de produtos" do
    test "criar um produto valido", %{test: test} do
      IO.puts("=========== Iniciando teste de ProductContext ===========")

      IO.puts("#{test}")

      collection_attributes = %{
        name: "Verão 2025",
        year: 2025,
        season: "Verão",
        release_date: ~D[2025-03-15]
      }

      assert {:ok, collection} = CollectionContext.create(collection_attributes)

      attrs = %{
        name: "Blusa Básica",
        description: "Blusa de algodão com corte básico",
        img_url: "https://example.com/blusa.jpg",
        collection_id: collection.id
      }

      assert {:ok, product} = ProductContext.create(attrs)
      assert product.name == "Blusa Básica"
      assert product.description == "Blusa de algodão com corte básico"
    end

    test "editando produto existente", %{test: test} do
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
          name: "Calça Jeans",
          description: "Calça jeans de corte reto",
          img_url: "https://example.com/calca.jpg",
          collection_id: collection.id
        })

      updated_attrs = %{name: "Calça Jeans Atualizada", description: "Nova descrição"}

      assert {:ok, updated_product} = ProductContext.update_product(product, updated_attrs)
      assert updated_product.name == "Calça Jeans Atualizada"
      assert updated_product.description == "Nova descrição"
    end

    test "deletando produto existente", %{test: test} do
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
          name: "Calça Jeans Deletada",
          description: "Calça jeans de corte reto",
          img_url: "https://example.com/calca.jpg",
          collection_id: collection.id
        })

      assert {:ok, delete_product} = ProductContext.delete_product(product)
      assert delete_product.name == "Calça Jeans Deletada"
      assert delete_product.description == "Calça jeans de corte reto"
    end

    test "buscando produto existente", %{test: test} do
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
          name: "Calça Jeans Buscada",
          description: "Calça jeans de corte reto",
          img_url: "https://example.com/calca.jpg",
          collection_id: collection.id
        })

      found = ProductContext.get_product!(product.id)
      assert found.id == product.id
      assert found.name == "Calça Jeans Buscada"
    end

    # todo continuar
  end
end
