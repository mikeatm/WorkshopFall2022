#!/bin/bash
#SBATCH --partition=job
#SBATCH -A col146
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --export=ALL
#SBATCH -t 128:00:00


### Run QE
mpirun --map-by core --mca btl_openib_if_include "mlx5_2:1" --mca btl openib,self,vader pw.x -input relax.in 1> relax.out 2> relax.err
