####################################
# 60 Second Guide to Deep Learning #
# Author: Jason D. Miller          #
# Email:  millerintllc@gmail.com   #
####################################

# Libraries ---------------------------------------------------------------
install.packages("pacman")
pacman::p_load(h2o)

# Data --------------------------------------------------------------------
data(Seatbelts)
summary(Seatbelts)
dim(Seatbelts)

# Analysis ----------------------------------------------------------------
h2o.init(nthreads = -1)

trainHex <- as.h2o(Seatbelts)
x_names  <- colnames(trainHex[2:8])

ann <- h2o.deeplearning(
                        x = x_names,
                        y = "DriversKilled",
                        training_frame = trainHex
)

ann