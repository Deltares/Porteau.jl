# model_input.jl

struct Model_input{T}
    useCUDA::Bool
    #data_type
    nx::Int64
    ny::Int64
    nz::Int64
    Δx::Float64
    Δy::Float64
    Δz::Float64
    Δt::Float64
    tend::Float64
    K0::Float64
    S0::Float64
    h0::Float64
    u0::Float64
    v0::Float64
    w0::Float64
    source::Float64
    i_src::Int64
    j_src::Int64
    k_src::Int64
    duration::Float64
    const_recharge::Float64
    recharge_factor::Float64
    boundary_pressure::T
end


#
# This function takes the model input
# Creates the model
#
function model_input()

    println("Reading model input ...")

    # Model size per dimension (-)
    nx   = 101
    ny   = 101
    nz   = 1

    # Grid sizes (m)
    Δx   = 80.0/(nx+1)
    Δy   = 80.0/(ny+1)
    Δz   = 10.0

    # hydraulic_conductivity (m/s)
    K0   = 10.0

    # specific storage (1/m)
    S0 = 0.0001

    # Time step (s)
    Δt = S0*(min(Δx,Δy,Δz))^2/(4.0*K0)
    println("Δt (Courant-like) = ", Δt)

    # Initial condition
    h0   = 1.1    # (m)
    u0   = 0.0     # (m/s)
    v0   = 0.0     # (m/s)
    w0   = 0.0     # (m/s)

    # Boundary conditions
    h_bc_west = 1.0
    h_bc_east = 1.0
    boundary_pressure = [h_bc_west, h_bc_east]

    # Source (well) data
    i_src  = 1
    j_src  = 1
    k_src  = 1
    duration = 0.0  # (s)
    source = 0.0    # (m3/s)

    # Recharge data
    # QR_nb = I_nb * M_nb * A_n
    # with QR_nb in (L^3/T, or m3/s)
    # I is the unit rescharge flux (m/s)
    # A is the cell area for cell n
    # M is a multiplier/factor
    const_recharge = 5.0e-4 * Δx * Δy# / (24*3600.) # (m3/s)
    recharge_factor = 1.0      # (-)

    # Test model:
    # 9 x 9 x 3: storage = 0.1x10-4
    # dx = dy = 10 m, dz = variable
    # recharge (N) of 5e-4
    # tend = 1Y (1D)?, dt = large

    # Simulation end time (s)
    tend = 100000.0

    # Backend selection
    println("Hit c for cuda...")
    c = readline()
    useCUDA = (c == "c")

    # Set corresponding data type
    # if useCUDA
    #     data_type = CuArray
    # else
    #     data_type = Array
    # end

    # Store the input in tuple "input"
    println("Grid specified: 3D grid with\n nx = ", nx, ",\n ny = ", ny, ",\n nz = ", nz, " and\n Δx = ", Δx, ",\n Δy = ", Δy, ",\n Δz = ", Δz)
    input = Model_input(useCUDA, nx, ny, nz, Δx, Δy, Δz, Δt, tend, K0, S0, h0, u0, v0, w0, source, i_src, j_src, k_src, duration, const_recharge, recharge_factor, boundary_pressure)

end
