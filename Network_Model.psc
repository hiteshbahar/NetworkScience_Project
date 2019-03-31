###########################################################
# Dynamic Network Model of MRSA in a Meta-population      #
# Netowrk Meta-Population Model						      #
# Queue-based Steady State Populations             	      #
# Author: Matthew Mietchen (matthew.mietchen@wsu.edu)     #
###########################################################

# Descriptive Information for PML File
Modelname: MRSA Meta-population Expanded
Description: PML Implementation of MRSA transmission model 

# Set model to run with numbers of individuals
Species_In_Conc: False
Output_In_Conc: False

#### Model Reactions ####


# Reactions Involving Uncontaminated Patients (S) #

R82:
	S > I + Acquisition
	rho_N * psi * P_u1 * (N_c1 / (N_c1 + N_u1)) * gamma
		

R88:
	S > I + Acquisition
	rho_D * psi * P_u1 * (D_c / (D_c + D_u))
			
R89:
	S > S
	theta * P_u1 * (1-nu)

R90:	
	S > I
	theta * P_u1 * nu
	

########################

# Reactions Involving Contaminated Patients (I) #
	
R136:
    I > S
    mu * P_c1
    
R137:
	I > I
	theta * P_c1 * nu

R138:
	I > S
	theta * P_c1 * (1-nu)


########################

### Parameter Values ###

## Time Values are in HOURS ##
# Compartments #

S = 3

I = 0


Acquisition = 0

# Contact Rates and Contamination Probabilities #
rho_N = 3.973 # nurse direct care tasks per patient per hour
rho_D = 0.181 # doctor direct care tasks per patient per hour 
sigma = 0.054 # hand contamination probability
psi = 0.0464 # successful colonization of an uncolonized patient probability

#gamma = 1.0 proportion of time a nurse is in the assigned/original cohort
gamma = 0.1667

# Exit (death/discharge) rates
theta = 0.00949 # probability of death/discharge

# Admission Proportions
nu = 0.0779 # proportion of admissions of colonized with MRSA

# Handwashing and Gown/Glove Change Rates
iota_N = 6.404 #11.92 nurse direct care tasks per hour with 56.55% compliance and 95% efficacy
iota_D = 1.748 #3.25 doctor direct care tasks per hour with 56.55% compliance and 95% efficacy
tau_N = 2.728 #3.30 nurse gown/glove changes per hour with 82.66% compliance
tau_D = 0.744 #0.90 doctor gown/glove changes per hour with 82.66% compliance

mu = 0.002083 # natural decolonization rate median 20 days per Star*ICU trial
