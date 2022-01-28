using SynchrotronKernel, Test

@testset "Synchrotron Kernel" begin

    @testset "F" begin
        @test SynchrotronKernel.F(1.e-8) ≈ 0.0046310000727714734
        @test SynchrotronKernel.F(  1.0) ≈ 0.6514228153553652
        @test SynchrotronKernel.F(  3.5) ≈ 0.08268719536694746
        @test SynchrotronKernel.F(  4.5) ≈ 0.03357441971502366
        @test SynchrotronKernel.F( 10.0) ≈ 0.00019223826430086885
        @test SynchrotronKernel.F( 50.0) ≈ 1.734785203976593e-21
        @test SynchrotronKernel.F(100.0) ≈ 4.697593665922202e-43
        @test SynchrotronKernel.F( 1.e6) == 0.0

        @test ℱ(1.0) == SynchrotronKernel.F(1.0)
    end
    
    @testset "G" begin
        @test SynchrotronKernel.G(1.0) ≈ 0.4944750621042115

        @test 𝒢(1.0) == SynchrotronKernel.G(1.0)
    end

    @testset "Synchrotron Kernel" begin
        @test synchrotron_kernel(1.0) == SynchrotronKernel.F(1.0)
    end

    @testset "Polarisation" begin
        K = SynchrotronKernel.F(1.0)
        sk_ort, sk_par = synchrotron_polarisation(1.0)

        @test sk_ort ≈ 0.5729489387297884
        @test sk_par ≈ 0.07847387662557684
        @test K == sk_ort + sk_par
    end

end