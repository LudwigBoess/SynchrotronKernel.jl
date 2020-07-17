using Documenter
using SynchrotronKernel

makedocs(
    sitename = "SynchrotronKernel",
    format = Documenter.HTML(),
    modules = [SynchrotronKernel]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/LudwigBoess/SynchrotronKernel.jl.git",
)
