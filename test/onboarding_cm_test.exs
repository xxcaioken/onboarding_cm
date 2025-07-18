defmodule OnboardingCmTest do
  use ExUnit.Case
  doctest OnboardingCm

  test "greets the world" do
    assert OnboardingCm.hello() == :world
  end
end
