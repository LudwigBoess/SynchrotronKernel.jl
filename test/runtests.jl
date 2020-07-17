using SynchrotronKernel, Test

@testset "Synchrotron Kernel" begin

    @test synchrotron_kernel(1.e-8) ≈ 0.0046310000727714734
    @test synchrotron_kernel(  1.0) ≈ 0.6514228153553652
    @test synchrotron_kernel(  3.5) ≈ 0.08268719536694746
    @test synchrotron_kernel(  4.5) ≈ 0.03357441971502366
    @test synchrotron_kernel( 10.0) ≈ 0.00019223826430086885
    @test synchrotron_kernel( 50.0) ≈ 1.734785203976593e-21
    @test synchrotron_kernel(100.0) ≈ 4.697593665922202e-43
    @test synchrotron_kernel( 1.e6) == 0.0

end