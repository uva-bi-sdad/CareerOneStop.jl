using Test, CareerOneStop
# Documentation
@testset "Documentation" begin
    using Documenter, CareerOneStop

    prefix = ".."

    DocMeta.setdocmeta!(CareerOneStop,
                       :DocTestSetup,
                       :(using CareerOneStop, Documenter;
                         ENV["COLUMNS"] = 120;
                         ENV["LINES"] = 30;),
                       recursive = true)
    doctest(CareerOneStop, fix = true)
    makedocs(sitename = "CareerOneStop",
             modules = [CareerOneStop],
             pages = [
                 "Introduction" => "index.md",
                 "API" => "api.md",
                 ],
             source = joinpath(prefix, "docs", "src"),
             build = joinpath(prefix, "docs", "build"),
             )
    @test true
end
