"""
    constants
"""

const GSL_SQRT_DBL_EPSILON = 1.4901161193847656e-08
const GSL_LOG_DBL_MIN = -7.0839641853226408e02

const synch_c0 = π / √(3)

const c01 = 0.2257913526447274323630976
const cond1 = 2 * √(2) * GSL_SQRT_DBL_EPSILON
const cond3 = -8 * GSL_LOG_DBL_MIN / 7

const synchrotron1_data = [ 30.364682982501076273,
                            17.079395277408394574,
                            4.560132133545072889,
                            0.549281246730419979,
                            0.372976075069301172e-01,
                            0.161362430201041242e-02,
                            0.481916772120371e-04,
                            0.10512425288938e-05,
                            0.174638504670e-07,
                            0.22815486544e-09,
                            0.240443082e-11,
                            0.2086588e-13,
                            0.15167e-15
                            ]

const synchrotron1a_data = [ 2.1329305161355000985,
                             0.741352864954200240e-01,
                             0.86968099909964198e-02,
                             0.11703826248775692e-02,
                             0.1645105798619192e-03,
                             0.240201021420640e-04,
                             0.35827756389389e-05,
                             0.5447747626984e-06,
                             0.838802856196e-07,
                             0.13069882684e-07,
                             0.2053099071e-08,
                             0.325187537e-09,
                             0.517914041e-10,
                             0.83002988e-11,
                             0.13352728e-11,
                             0.2159150e-12,
                             0.349967e-13,
                             0.56994e-14,
                             0.9291e-15,
                             0.152e-15,
                             0.249e-16,
                             0.41e-17,
                             0.7e-18
                            ]

const synchrotron2_data = [  0.4490721623532660844,
                             0.898353677994187218e-01,
                             0.81044573772151290e-02,
                             0.4261716991089162e-03,
                             0.147609631270746e-04,
                             0.3628633615300e-06,
                             0.66634807498e-08,
                             0.949077166e-10,
                             0.1079125e-11,
                             0.10022e-13,
                             0.77e-16,
                             0.5e-18
                            ]



@inline @fastmath function cheb_eval(coeff::Vector{<:Real}, order::Integer, x::Real)

    d  = 0.0
    dd = 0.0

    x2 = 2x

    @inbounds for j = order:-1:2
        temp = d
        d = x2 * d - dd + coeff[j]
        dd = temp
    end

    d = x * d - dd + 0.5 * coeff[1]

    return d
end


"""
    F(x::Real)

Computes the first synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.

``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``

"""
@inline function F(x::Real)

    if x < cond1

        z = ∛(x)
        cf = 1 - 8.43812762813205e-01 * z * z
        return 2.14952824153447863671 * z * cf

    elseif x <= 4.0

        px = ∛(x)
        px11 = px*px*px*px*px*px*px*px*px*px*px
        t = x^2 / 8.0 - 1.0
        result_c1 = cheb_eval( synchrotron1_data, 13, t )

        result_c2 = cheb_eval( synchrotron2_data, 12, t )

        return px * result_c1 - px11 * result_c2 - synch_c0 * x

    elseif x < cond3

        t = (12 - x) / (x + 4)

        result_c1 = cheb_eval( synchrotron1a_data, 23, t )

        return √(x) * result_c1 * exp(c01 - x)

    else
        return 0.0
    end
end


"""
    ℱ(x::Real)

Computes the first synchrotron function at a given frequency ratio ``x = \\frac{\\nu}{\\nu_0}``.

``F(x) = x \\int_x^\\infty K_{\\frac{5}{3}}(t) dt``

Wrapper for [`F`](@ref).
"""
const ℱ = F
