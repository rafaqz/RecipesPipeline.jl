using Distributions
using FileIO
using GeometryBasics
using ImageMagick
using Images
using OffsetArrays
using Plots
using Random
using RecipesPipeline
using RDatasets
using SparseArrays
using StaticArrays
using Statistics
using StatsPlots
using Test
using TestImages

@testset "unzip" begin
    x, y, z = unzip([(1., 2., 3.), (1., 2., 3.)])
    @test all(x .== 1.) && all(y .== 2.) && all(z .== 3.)
    x, y, z = unzip(Tuple{Float64, Float64, Float64}[])
    @test isempty(x) && isempty(y) && isempty(z)
end

@testset "group" begin
    include("test_group.jl")
end

@testset "plots" begin
    for i in eachindex(Plots._examples)
        if i ∉ Plots._backend_skips[:gr]
            @test Plots.test_examples(:gr, i, disp=false) isa Plots.Plot
        end
    end
end

#=
makie_test_dir = joinpath(@__DIR__, "test_makie")
mkpath(makie_test_dir)

@testset "Makie integration" begin
    cd(makie_test_dir) do
        include("makie.jl")
    end
end
=#
