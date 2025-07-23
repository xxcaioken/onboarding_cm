# OnboardingCm

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `onboarding_cm` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:onboarding_cm, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/onboarding_cm>.

# how to add some values into DB

## MIX:

### alias OnboardingCm.BLL.MixContext

### attrs = %{name: "Base"}

### MixContext.create(attrs)

## MIX_PRODUCTS

### alias OnboardingCm.BLL.MixProductContext

### attrs = %{mix_id: 2, product_map: "%{name: 'camisa', img_url: 'youtube.com', description: 'oioioioioi'}"}

### MixProductContext.create(attrs)

# COLLECTION:

### alias OnboardingCm.BLL.CollectionContext

### attrs = %{name: "Collection", collection_year: "2026", collection_season: "spring", release_date: "2025-12-25"}

### CollectionContext.create(attrs)

# PRODUCT:

### alias OnboardingCm.BLL.ProductContext

### attrs = %{collection_id: 1, name: "camisa", img_url: "youtube.com", description: "oioioioioi"}

### ProductContext.create(attrs)

# TAG:

### alias OnboardingCm.BLL.TagContext

### attrs = %{name: "camisas"}

### TagContext.create(attrs)

# PRODUCT_TAG:

### alias OnboardingCm.BLL.TagProductsContext

### attrs = %{tag_id: 1, product_id: 1}

### TagProductsContext.create(attrs)
