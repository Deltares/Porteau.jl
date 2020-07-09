# test stencil operator

include("grids.jl")
#include("operators.jl")

abstract type Stencil end

# Internal cell type
struct InternalCell <:Stencil end

# 6 faces of the domain
struct WestBoundaryCell <:Stencil end
struct EastBoundaryCell <:Stencil end
struct SouthBoundaryCell <:Stencil end
struct NorthBoundaryCell <:Stencil end
struct BottomBoundaryCell <:Stencil end
struct TopBoundaryCell <:Stencil end

# 12 sides of the domain
struct SouthWestBoundaryCell <:Stencil end
struct SouthEastBoundaryCell <:Stencil end
struct NorthWestBoundaryCell <:Stencil end
struct NorthEastBoundaryCell <:Stencil end
struct BottomWestBoundaryCell <:Stencil end
struct BottomEastBoundaryCell <:Stencil end
struct TopWestBoundaryCell <:Stencil end
struct TopEastBoundaryCell <:Stencil end
struct BottomSouthBoundaryCell <:Stencil end
struct BottomNorthBoundaryCell <:Stencil end
struct TopSouthBoundaryCell <:Stencil end
struct TopNorthBoundaryCell <:Stencil end

# 8 corners of the domain
struct BottomSouthWestBoundaryCell <:Stencil end
struct BottomSouthEastBoundaryCell <:Stencil end
struct BottomNorthWestBoundaryCell <:Stencil end
struct BottomNorthEastBoundaryCell <:Stencil end
struct TopSouthWestBoundaryCell <:Stencil end
struct TopSouthEastBoundaryCell <:Stencil end
struct TopNorthWestBoundaryCell <:Stencil end
struct TopNorthEastBoundaryCell <:Stencil end


# Stencil for internal cell
@inline function get_stencil(cell, stencil_type::InternalCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,6)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j-1, k  )
    stencil[4] = (i  , j+1, k  )
    stencil[5] = (i  , j  , k-1)
    stencil[6] = (i  , j  , k+1)
    return stencil
end

# Stencil for west boundary cell
@inline function get_stencil(cell, stencil_type::WestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,5)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k-1)
    stencil[5] = (i  , j  , k+1)
    return stencil
end

# Stencil for east boundary cell
@inline function get_stencil(cell, stencil_type::EastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,5)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k-1)
    stencil[5] = (i  , j  , k+1)
    return stencil
end

# Stencil for south boundary cell
@inline function get_stencil(cell, stencil_type::SouthBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,5)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k-1)
    stencil[5] = (i  , j  , k+1)
    return stencil
end

# Stencil for north boundary cell
@inline function get_stencil(cell, stencil_type::NorthBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,5)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j-1, k  )
    stencil[4] = (i  , j  , k-1)
    stencil[5] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom boundary cell
@inline function get_stencil(cell, stencil_type::BottomBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,5)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j-1, k  )
    stencil[4] = (i  , j+1, k  )
    stencil[5] = (i  , j  , k+1)
    return stencil
end

# Stencil for top boundary cell
@inline function get_stencil(cell, stencil_type::TopBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,5)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j-1, k  )
    stencil[4] = (i  , j+1, k  )
    stencil[5] = (i  , j  , k-1)
    return stencil
end

# Stencil for south-west boundary cell
@inline function get_stencil(cell, stencil_type::SouthWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j+1, k  )
    stencil[3] = (i  , j  , k-1)
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for south-west boundary cell
@inline function get_stencil(cell, stencil_type::SouthEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j+1, k  )
    stencil[3] = (i  , j  , k-1)
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for south-west boundary cell
@inline function get_stencil(cell, stencil_type::NorthWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j  , k-1)
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for south-west boundary cell
@inline function get_stencil(cell, stencil_type::NorthEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j  , k-1)
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom-west boundary cell
@inline function get_stencil(cell, stencil_type::BottomWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom-east boundary cell
@inline function get_stencil(cell, stencil_type::BottomEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom-south boundary cell
@inline function get_stencil(cell, stencil_type::BottomSouthBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom-north boundary cell
@inline function get_stencil(cell, stencil_type::BottomNorthBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j-1, k  )
    stencil[4] = (i  , j  , k+1)
    return stencil
end

# Stencil for top-west boundary cell
@inline function get_stencil(cell, stencil_type::TopWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k-1)
    return stencil
end

# Stencil for top-east boundary cell
@inline function get_stencil(cell, stencil_type::TopEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k-1)
    return stencil
end

# Stencil for top-south boundary cell
@inline function get_stencil(cell, stencil_type::TopSouthBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j+1, k  )
    stencil[4] = (i  , j  , k-1)
    return stencil
end

# Stencil for top-north boundary cell
@inline function get_stencil(cell, stencil_type::TopNorthBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,4)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i+1, j  , k  )
    stencil[3] = (i  , j-1, k  )
    stencil[4] = (i  , j  , k-1)
    return stencil
end

# Stencil for bottom south-west boundary cell
@inline function get_stencil(cell, stencil_type::BottomSouthWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j+1, k  )
    stencil[3] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom south-east boundary cell
@inline function get_stencil(cell, stencil_type::BottomSouthEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j+1, k  )
    stencil[3] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom north-west boundary cell
@inline function get_stencil(cell, stencil_type::BottomNorthWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j  , k+1)
    return stencil
end

# Stencil for bottom north-east boundary cell
@inline function get_stencil(cell, stencil_type::BottomNorthEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j  , k+1)
    return stencil
end

# Stencil for top south-west boundary cell
@inline function get_stencil(cell, stencil_type::TopSouthWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j+1, k  )
    stencil[3] = (i  , j  , k-1)
    return stencil
end

# Stencil for top south-east boundary cell
@inline function get_stencil(cell, stencil_type::TopSouthEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j+1, k  )
    stencil[3] = (i  , j  , k-1)
    return stencil
end

# Stencil for top north-west boundary cell
@inline function get_stencil(cell, stencil_type::TopNorthWestBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i+1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j  , k-1)
    return stencil
end

# Stencil for top north-east boundary cell
@inline function get_stencil(cell, stencil_type::TopNorthEastBoundaryCell)
    (i, j, k) = cell
    stencil = Array{Tuple,1}(undef,3)
    stencil[1] = (i-1, j  , k  )
    stencil[2] = (i  , j-1, k  )
    stencil[3] = (i  , j  , k-1)
    return stencil
end




function set_stencil_type(grid) #, stencil_type)

    nx = grid.nx
    ny = grid.ny
    nz = grid.nz

    stencil_type = Array{Any,3}(undef, (nx,ny,nz))

    for k = 2:nz
        for j = 2:ny
            for i = 1:nx
                stencil_type[i,j,k] = InternalCell()
            end
        end
    end

    # Initialize all cells to be of Internal cell type
    #stencil_type[: ,: ,: ] .= InternalCell

    # Modify the 6 faces of the domain
    for k = 2:nz
        for j = 2:ny
            stencil_type[1 ,j ,k ] = WestBoundaryCell()
            stencil_type[nx,j ,k ] = EastBoundaryCell()
        end
    end

    for k = 2:nz
        for i = 1:nx
            stencil_type[i ,1 ,k ] = SouthBoundaryCell()
            stencil_type[i ,ny,k ] = NorthBoundaryCell()
        end
    end

    for j = 2:ny
        for i = 1:nx
            stencil_type[i ,j ,1 ] = BottomBoundaryCell()
            stencil_type[i ,j ,nz] = TopBoundaryCell()
        end
    end

    # Modify the 12 sides of the domain
    for k = 1:nz
        stencil_type[1 ,1 ,k ] = SouthWestBoundaryCell()
        stencil_type[nx,1 ,k ] = SouthEastBoundaryCell()
        stencil_type[1 ,ny,k ] = NorthWestBoundaryCell()
        stencil_type[nx,ny,k ] = NorthEastBoundaryCell()
    end

    for j = 1:ny
        stencil_type[1 ,j ,1 ] = BottomWestBoundaryCell()
        stencil_type[nx,j ,1 ] = BottomEastBoundaryCell()
        stencil_type[1 ,j ,nz] = TopWestBoundaryCell()
        stencil_type[nx,j ,nz] = TopEastBoundaryCell()
    end

    for i = 1:nx
        stencil_type[i ,1 ,1 ] = BottomSouthBoundaryCell()
        stencil_type[i ,ny,1 ] = BottomNorthBoundaryCell()
        stencil_type[i ,1 ,nz] = TopSouthBoundaryCell()
        stencil_type[i ,ny,nz] = TopNorthBoundaryCell()
    end

    # Finally modify the 4 domain corners
    stencil_type[1 ,1 ,1 ] = BottomSouthWestBoundaryCell()
    stencil_type[nx,1 ,1 ] = BottomSouthEastBoundaryCell()
    stencil_type[1 ,ny,1 ] = BottomNorthWestBoundaryCell()
    stencil_type[nx,ny,1 ] = BottomNorthEastBoundaryCell()
    stencil_type[1 ,1 ,nz] = TopSouthWestBoundaryCell()
    stencil_type[nx,1 ,nz] = TopSouthEastBoundaryCell()
    stencil_type[1 ,ny,nz] = TopNorthWestBoundaryCell()
    stencil_type[nx,ny,nz] = TopNorthEastBoundaryCell()

    return stencil_type
end

function kernel!(cell, h, hnew, K, neighbours)
    (i, j, k ) = cell
    num_neighbours = size(neighbours)[1]
    #@show neighbours
    hnew[i,j,k] = h[i,j,k]
    for nb = 1:num_neighbours
        hnew[i,j,k] += add_flux(cell, h, K, neighbours[nb])
    end
    return hnew
end

function kernel_no_stencil!(cell, h, hnew, K)
    (i, j, k ) = cell

    hnew[i,j,k] = h[i,j,k] +
                    K[i,j,k]*(h[i+1,j  ,k  ]-2h[i,j,k] + h[i-1,j  ,k  ] +
                              h[i  ,j+1,k  ]-2h[i,j,k] + h[i  ,j-1,k  ] +
                              h[i  ,j  ,k+1]-2h[i,j,k] + h[i  ,j  ,k-1] )
    return hnew
end

function add_flux(cell, h, K, neighb)
    (i ,j ,k ) = cell
    (in,jn,kn) = neighb
    # Take the direction of the neighbour into account
    s = Float64(sign(i-in)+sign(j-jn)+sign(k-kn))
    flux = s * K[i,j,k] * (h[i,j,k]-h[in,jn,kn])
end

function test_full_stencil_based!(grid, h, hnew, K, stencil_type)
    nx = grid.nx
    ny = grid.ny
    nz = grid.nz

    for k = 1:nz
        for j = 1:ny
            for i = 1:nx
                cell = (i,j,k)
                # @inbounds
                neighbours = Nothing
                neighbours = get_stencil(cell, stencil_type[i,j,k])
                hnew = kernel!(cell, h, hnew, K, neighbours)
                #@show size(neighbours)
            end
        end
    end

end

function test_stencil_based!(grid, h, hnew, K, stencil_type)
    nx = grid.nx
    ny = grid.ny
    nz = grid.nz

    for k = 2:nz-1
        for j = 2:ny-1
            for i = 2:nx-1
                cell = (i,j,k)
                # @inbounds
                neighbours = Nothing
                neighbours = get_stencil(cell, stencil_type[i,j,k])
                hnew = kernel!(cell, h, hnew, K, neighbours)
                #@show size(neighbours)
            end
        end
    end

end

function test_no_stencil!(grid, h, hnew, K)
    nx = grid.nx
    ny = grid.ny
    nz = grid.nz

    for k = 2:nz-1
        for j = 2:ny-1
            for i = 2:nx-1
                cell = (i,j,k)
                # @inbounds
                hnew = kernel_no_stencil!(cell, h, hnew, K)
                #@show size(neighbours)
            end
        end
    end

end

function test_stencil()

    nx = 40
    ny = 40
    nz = 40
    dx = 10.0
    dy = 10.0
    dz = 10.0
    useCUDA = false

    h0 = 10.0
    K0 = 1.0e-4

    h = fill(h0,(nx,ny,nz))
    hnew = copy(h)
    K = fill(K0,(nx,ny,nz))

    x,y,z = grid_coords(nx, ny, nz, dx, dy, dz, useCUDA)

    grid = Grid(nx,ny, nz, dx, dy, dz, x, y, z)

    #stencil_type = fill(nothing, (nx, ny, nz))

    stencil_type = set_stencil_type(grid) #, stencil_type)

    #@time test_full_stencil_based!(grid, h, hnew, K, stencil_type)
    @time test_stencil_based!(grid, h, hnew, K, stencil_type)
    @time test_no_stencil!(grid, h, hnew, K)

end

test_stencil()
