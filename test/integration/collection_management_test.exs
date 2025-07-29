   defmodule OnboardingCm.Integration.CollectionManagementTest do
     use OnboardingCm.RepoCase
     alias OnboardingCm.BLL.{CollectionContext, ProductContext, TagContext, TagProductsContext}
     describe "fluxo completo de gestão de coleções" do
       test "criar uma coleção completa com produtos e tags" do
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
             description: "Blusa de algodão com corte básico",
             img_url: "https://example.com/blusa.jpg",
             collection_id: collection.id
           })
         product2 =
           ProductContext.create!(%{
             name: "Calça Jeans",
             description: "Calça jeans clássica",
             img_url: "https://example.com/calca.jpg",
             collection_id: collection.id
           })
         price_tag = TagContext.create!(%{name: "Faixa", value: "199,00", category: "Preço"})
         public_tag =
           TagContext.create!(%{name: "Público", value: "Adulto", category: "Segmentação"})
         material_tag =
           TagContext.create!(%{name: "Material", value: "Algodão", category: "Composição"})
         TagProductsContext.create!(%{tag_id: price_tag.id, product_id: product1.id})
         TagProductsContext.create!(%{tag_id: public_tag.id, product_id: product1.id})
         TagProductsContext.create!(%{tag_id: material_tag.id, product_id: product1.id})
         TagProductsContext.create!(%{tag_id: price_tag.id, product_id: product2.id})
         TagProductsContext.create!(%{tag_id: public_tag.id, product_id: product2.id})
         collections = CollectionContext.list_collections()
         products = ProductContext.list_products()
         tags = TagContext.list_tags()
         tag_products = TagProductsContext.list_tag_products()
         assert length(collections) == 1
         assert length(products) == 2
         assert length(tags) == 3
         assert length(tag_products) == 5
         assert Enum.all?(products, &(&1.collection_id == collection.id))
         assert Enum.any?(tags, &(&1.name == "Faixa"))
         assert Enum.any?(tags, &(&1.name == "Público"))
         assert Enum.any?(tags, &(&1.name == "Material"))
       end
       test "gerenciar múltiplas coleções com produtos e tags" do
         collection1 =
           CollectionContext.create!(%{
             name: "Verão 2025",
             year: 2025,
             season: "Verão",
             release_date: ~D[2025-03-15]
           })
         collection2 =
           CollectionContext.create!(%{
             name: "Inverno 2025",
             year: 2025,
             season: "Inverno",
             release_date: ~D[2025-06-15]
           })
         product1 =
           ProductContext.create!(%{
             name: "Blusa de Verão",
             description: "Blusa leve",
             img_url: "https://example.com/blusa.jpg",
             collection_id: collection1.id
           })
         product2 =
           ProductContext.create!(%{
             name: "Casaco de Inverno",
             description: "Casaco quente",
             img_url: "https://example.com/casaco.jpg",
             collection_id: collection2.id
           })
         price_tag = TagContext.create!(%{name: "Faixa", value: "199,00", category: "Preço"})
         public_tag =
           TagContext.create!(%{name: "Público", value: "Adulto", category: "Segmentação"})
         TagProductsContext.create!(%{tag_id: price_tag.id, product_id: product1.id})
         TagProductsContext.create!(%{tag_id: public_tag.id, product_id: product1.id})
         TagProductsContext.create!(%{tag_id: price_tag.id, product_id: product2.id})
         collections = CollectionContext.list_collections()
         products = ProductContext.list_products()
         tag_products = TagProductsContext.list_tag_products()
         assert length(collections) == 2
         assert length(products) == 2
         assert length(tag_products) == 3
         verao_products = Enum.filter(products, &(&1.collection_id == collection1.id))
         inverno_products = Enum.filter(products, &(&1.collection_id == collection2.id))
         assert length(verao_products) == 1
         assert length(inverno_products) == 1
         assert hd(verao_products).name == "Blusa de Verão"
         assert hd(inverno_products).name == "Casaco de Inverno"
       end
     end
   end
