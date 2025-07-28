alias OnboardingCm.BLL.{CollectionContext, ProductContext, TagContext, TagProductsContext}

collection_attrs = %{
  name: "Verão 2025",
  year: 2025,
  season: "Verão",
  release_date: ~D[2025-03-15]
}

case CollectionContext.create(collection_attrs) do
  {:ok, collection} ->
    IO.puts("✅ Coleção criada com ID: #{collection.id}")

    product_attrs = %{
      name: "Blusa Básica",
      description: "Blusa de algodão com corte básico",
      img_url: "https://example.com/blusa.jpg",
      collection_id: collection.id
    }

    case ProductContext.create(product_attrs) do
      {:ok, product} ->

        price_tag_attrs = %{name: "Faixa", value: "199,00", category: "Preço"}
        public_tag_attrs = %{name: "Público", value: "Adulto", category: "Segmentação"}

        case TagContext.create(price_tag_attrs) do
          {:ok, price_tag} ->

            case TagContext.create(public_tag_attrs) do
              {:ok, public_tag} ->

                case TagProductsContext.create(%{tag_id: price_tag.id, product_id: product.id}) do
                  {:ok, _} ->

                    case TagProductsContext.create(%{tag_id: public_tag.id, product_id: product.id}) do
                    end
                end
            end
        end
    end
end
