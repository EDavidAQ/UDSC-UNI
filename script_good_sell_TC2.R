## Analytical Project: : Good Sells in TC

################################################################################

# Fecha : 10-10-16
# Modelador : Ebson David Allende Quintana
# email: david.allende@outlook.com
# Script Version : 1.0

################################################################################


################################################################################
# Non Client Predict Model
################################################################################

# Worspace

setwd("D:/Interbank/Tc_Good_Sell/7_UNALM")
getwd()

# Data (All variables)

data_tc_nc <- read.csv(file = "datos_tc_uni.csv")
dim(data_tc_nc)
head(data_tc_nc)
colnames(data_tc_nc)

str(data_tc_nc)
table(data_tc_nc$FLG_CLIENTE4)
table(data_tc_nc$TARGET_XF)


data_tc_nc <-data_tc_nc[-188]


datos_tc<-data_tc_nc[,c("LINEA_TC",
"TIPO_FLUJO_TC",
"INGRESO_BRUTO",
"EMP_REP_TC_SF",
"EMP_REP_TC_BN",
"EMP_REP_PP_SF",
"EMP_REP_PP_BN",
"EMP_REP_CONV_SF",
"EMP_REP_CONV_BN",
"EMP_REP_VEH_SF",
"EMP_REP_VEH_BN",
"EMP_REP_HIP_SF",
"EMP_REP_HIP_BN",
"FLG_TC_SF",
"FLG_TC_BN",
"FLG_PP_SF",
"FLG_PP_BN",
"FLG_CONV_SF",
"FLG_CONV_BN",
"FLG_VEH_SF",
"FLG_VEH_BN",
"FLG_HIP_SF",
"FLG_HIP_BN",
"FLG_BANCARIZADO",
"FLG_CLI_SF",
"FLG_CLI_BN",
"CLF_SBS",
"FLG_CLIENTE4",
"FLG_SEGURO",
"CLI_AHOCRED",
"CLI_CTS",
"CLI_FM",
"CLI_MILL",
"CLI_PLA",
"CLI_PLAFI",
"CLI_TXS",
"NRO_PAS_BN",
"FLG_PAS",
"SALDO_TC_SF",
"SALDO_PP_SF",
"SALDO_CONV_SF",
"SALDO_VEH_SF",
"SALDO_HIP_SF",
"SALDO_TCSF_UU6",
"MAX_SALDO_TCSF_U6",
"MIN_SALDO_TCSF_U6",
"MAX_LINEA_TCSF",
"MIN_LINEA_TCSF",
"LINEA_TOT_TCSF",
"MAX_SALTC_SF_UM",
"MIN_SALTC_SF_UM",
"SALDO_SF_UM",
"NRO_ENT_REP_TOT_U6",
"NRO_ENT_REP_SAL_TOT_U6",
"PORC_ENT_REP_SAL",
"NRO_ENT_REP_TOT_UM",
"NRO_ENT_REP_SAL_TOT_UM",
"MON_MILL_U6",
"MON_PLA_U6",
"MON_FIJ_U6",
"MON_CTS_U6",
"MON_TRX_U6",
"MON_AHCRE_U6",
"MON_INV_U6",
"MON_MILL_M1",
"MON_PLA_M1",
"MON_FIJ_M1",
"MON_CTS_M1",
"MON_TRX_M1",
"MON_AHCRE_M1",
"MON_INV_M1",
"IND_EMP_REP_PP_SF",
"IND_EMP_REP_PP_BN",
"IND_EMP_REP_CONV_SF",
"IND_EMP_REP_CONV_BN",
"IND_EMP_REP_VEH_SF",
"IND_EMP_REP_VEH_BN",
"IND_EMP_REP_HIP_SF",
"IND_EMP_REP_HIP_BN",
"SALDO_TOT_ACT",
"IND_MAX_SAL_TCSF_U6",
"IND_MAXLIN_ING",
"IND_LINIBK_ING",
"IND_DEU_ING",
"EDAD",
"SEXO",
"SIT_LAB",
"DEPARTAMENTO",
"PROB_CONT",
"CAMP_TOT",
"PROM_CAMP",
"RECENCIA_CAMP",
"NRO_CAMP_TC",
"CAMP_TC_U6",
"CREC_ENT_REP_TC",
"CREC_SAL_TC",
"SBS_CLF",
"TARGET_XF",
"CANALVTA_HOM",
"FLG_CAMP",
"CANAL_ASIGNADO",
"ARRIBO_PJE")]

write.csv(datos_tc,"datos_tc.csv",row.names=TRUE)


#attach(data_tc_nc)

# Define roles and types of inputs

colnames(data_tc_nc)
table(data_tc_nc$TARGET_XF)

data_tc_nc<-data_tc_nc[-c(2,3)]
head(data_tc_nc)
str(data_tc_nc)

write.table(data_tc_nc,"data_tc_nc.csv",sep=",",col.names = T)



data_tc_nc2<-data_tc_nc[-2]


str(FLG_FRESCO)


table(FLG_TC_SF)
table(FLG_PP_SF)
table(FLG_PP_BN)
table(FLG_CONV_SF)
table(FLG_CONV_BN)
table(FLG_VEH_SF)
table(FLG_VEH_BN)
table(FLG_HIP_SF)
table(FLG_HIP_BN)
table(FLG_BANCARIZADO)
table(FLG_CLI_SF)
table(FLG_CLI_BN)
table(FLG_SEGURO)
table(CLI_AHOCRED)
table(CLI_CTS)
table(CLI_FM)
table(CLI_MILL)
table(CLI_PLA)
table(CLI_PLAFI)
table(CLI_TXS)
table(FLG_PAS)
table(SEXO)
table(SIT_LAB)
table(DEPARTAMENTO)
table(SBS_CLF)
table(TARGET_XF)
table(FLG_FRESCO)
table(ARRIBO_PJE)
table(FLG_TIP_PERSONA)

# Factor Variables

data_tc_nc$FLG_TC_SF<-factor(data_tc_nc$FLG_TC_SF,levels=c(0,1))
data_tc_nc$FLG_TC_BN<-factor(data_tc_nc$FLG_TC_BN,levels=c(0,1))
data_tc_nc$FLG_PP_SF<-factor(data_tc_nc$FLG_PP_SF,levels=c(0,1))
data_tc_nc$FLG_PP_BN<-factor(data_tc_nc$FLG_PP_BN,levels=c(0,1))
data_tc_nc$FLG_CONV_SF<-factor(data_tc_nc$FLG_CONV_SF,levels=c(0,1))
data_tc_nc$FLG_CONV_BN<-factor(data_tc_nc$FLG_CONV_BN,levels=c(0,1))
data_tc_nc$FLG_VEH_SF<-factor(data_tc_nc$FLG_VEH_SF,levels=c(0,1))
data_tc_nc$FLG_VEH_BN<-factor(data_tc_nc$FLG_VEH_BN,levels=c(0,1))
data_tc_nc$FLG_HIP_SF<-factor(data_tc_nc$FLG_HIP_SF,levels=c(0,1))
data_tc_nc$FLG_HIP_BN<-factor(data_tc_nc$FLG_HIP_BN,levels=c(0,1))
data_tc_nc$data_tc_nc$FLG_BANCARIZADO<-factor(data_tc_nc$FLG_BANCARIZADO,
                                              levels=c(0,1))
data_tc_nc$FLG_CLI_SF<-factor(data_tc_nc$FLG_CLI_SF,levels=c(0,1))
data_tc_nc$FLG_CLI_BN<-factor(data_tc_nc$FLG_CLI_BN,levels=c(0,1))
data_tc_nc$FLG_SEGURO<-factor(data_tc_nc$FLG_SEGURO,levels=c(0,1))
data_tc_nc$CLI_AHOCRED<-factor(data_tc_nc$CLI_AHOCRED,levels=c(0,1))
data_tc_nc$CLI_CTS<-factor(data_tc_nc$CLI_CTS,levels=c(0,1))
data_tc_nc$CLI_FM<-factor(data_tc_nc$CLI_FM,levels=c(0,1))
data_tc_nc$CLI_MILL<-factor(data_tc_nc$CLI_MILL,levels=c(0,1))
data_tc_nc$CLI_PLA<-factor(data_tc_nc$CLI_PLA,levels=c(0,1))
data_tc_nc$CLI_PLAFI<-factor(data_tc_nc$CLI_PLAFI,levels=c(0,1))
data_tc_nc$CLI_TXS<-factor(data_tc_nc$CLI_TXS,levels=c(0,1))
data_tc_nc$FLG_PAS<-factor(data_tc_nc$FLG_PAS,levels=c(0,1))
data_tc_nc$SBS_CLF<-factor(data_tc_nc$SBS_CLF,levels=c(0,1,99))
data_tc_nc$TARGET_XF<-factor(data_tc_nc$TARGET_XF,levels=c(0,1))
data_tc_nc$ARRIBO_PJE<-factor(data_tc_nc$ARRIBO_PJE,levels=c(0,1,2,3,4,5,6))
data_tc_nc$FLG_TIP_PERSONA<-factor(data_tc_nc$FLG_TIP_PERSONA,
                                   levels=c(1,2,3,4,5,6,7,8,9,10))


#detach(data_tc_nc)

# Data (All variables selected for the non client predictive model)

str(data_tc_nc)

data_tc_nc_2 <-data_tc_nc[,c(4:5,7:8,10,12,14,16,18,20,22,24,26,28:29,44:62,77
                             ,79,81,83,85:98,102:105,107:112,114:115,117:119,
                             126:172,183:185)]

head(data_tc_nc[c(
  "INGRESO_BRUTO",
  "EMP_REP_TC_SF",
  "EMP_REP_PP_SF",
  "EMP_REP_CONV_SF",
  "EMP_REP_VEH_SF",
  "EMP_REP_HIP_SF",
  "FLG_TC_SF",
  "FLG_PP_SF",
  "FLG_CONV_SF",
  "FLG_VEH_SF",
  "FLG_HIP_SF",
  "FLG_BANCARIZADO",
  "FLG_CLI_SF",
  "SALDO_TC_SF",
  "SALDO_PP_SF",
  "SALDO_CONV_SF",
  "SALDO_VEH_SF",
  "SALDO_HIP_SF",
  "SALDO_TCSF_UU6",
  "MAX_SALDO_TCSF_U6",
  "MIN_SALDO_TCSF_U6",
  "MAX_LINEA_TCSF",
  "MIN_LINEA_TCSF",
  "LINEA_TOT_TCSF",
  "MAX_SALTC_SF_UM",
  "MIN_SALTC_SF_UM",
  "SALDO_SF_UM",
  "NRO_ENT_REP_TOT_U6",
  "NRO_ENT_REP_SAL_TOT_U6",
  "PORC_ENT_REP_SAL",
  "NRO_ENT_REP_TOT_UM",
  "NRO_ENT_REP_SAL_TOT_UM",
  "IND_EMP_REP_PP_SF",
  "IND_EMP_REP_CONV_SF",
  "IND_EMP_REP_VEH_SF",
  "IND_EMP_REP_HIP_SF",
  "SALDO_TOT_ACT",
  "IND_SAL_TC",
  "IND_SAL_PP",
  "IND_SAL_CONV",
  "IND_SAL_VEH",
  "IND_SAL_HIP",
  "IND_MAX_SAL_TCSF_U6",
  "IND_MIN_SAL_TCSF_U6",
  "IND_MAX_LIN_TCSF",
  "IND_MIN_LIN_TCSF",
  "IND_MAX_SALTC_SF_UM",
  "IND_MIN_SALTC_SF_UM",
  "IND_ENT_REP_U6_SAL",
  "IND_ENT_REP_UM_SAL",
  "IND_MAXLIN_ING",
  "IND_DEU_ING",
  "EDAD",
  "SEXO",
  "SIT_LAB",
  "DEPARTAMENTO",
  "CREC_ENT_REP_TC",
  "CREC_ENT_REP_M13",
  "CREC_ENT_REP_M12",
  "CREC_ENT_REP_SAL_TC",
  "CREC_ENT_REP_SAL_M13",
  "CREC_ENT_REP_SAL_M12",
  "CREC_SAL_TC",
  "CREC_SAL_TC_M13",
  "CREC_SAL_TC_M12",
  "CREC_ENT_REP_PP",
  "CREC_ENT_REP_PP_M13",
  "CREC_ENT_REP_PP_M12",
  "CREC_SALDO_PP",
  "CREC_SALDO_PP_M13",
  "CREC_SALDO_PP_M12",
  "CREC_SAL_VIG_PP",
  "CREC_SAL_VIG_PP_M13",
  "CREC_SAL_VIG_PP_M12",
  "CREC_ENT_REP_CONV",
  "CREC_ENT_REP_CONV_M13",
  "CREC_ENT_REP_CONV_M12",
  "CREC_SALDO_CONV",
  "CREC_SALDO_CONV_M13",
  "CREC_SALDO_CONV_M12",
  "CREC_SAL_VIG_CONV",
  "CREC_SAL_VIG_CONV_M13",
  "CREC_SAL_VIG_CONV_M12",
  "CREC_ENT_REP_VEH",
  "CREC_ENT_REP_VEH_M13",
  "CREC_ENT_REP_VEH_M12",
  "CREC_SALDO_VEH",
  "CREC_SALDO_VEH_M13",
  "CREC_SALDO_VEH_M12",
  "CREC_SAL_VIG_VEH",
  "CREC_SAL_VIG_VEH_M13",
  "CREC_SAL_VIG_VEH_M12",
  "CREC_ENT_REP_HIP",
  "CREC_ENT_REP_HIP_M13",
  "CREC_ENT_REP_HIP_M12",
  "CREC_SALDO_HIP",
  "CREC_SALDO_HIP_M13",
  "CREC_SALDO_HIP_M12",
  "CREC_SAL_VIG_HIP",
  "CREC_SAL_VIG_HIP_M13",
  "CREC_SAL_VIG_HIP_M12",
  "SBS_CLF",
  "TARGET_XF",
  "FLG_TIP_PERSONA"
)])

str(data_tc_nc$TARGET_XF)
str(data_tc_nc_2)
names(data_tc_nc_2)


################################################################################
# Market Predictive Model
################################################################################


data_tc_nc_3<-data_tc_nc[,c(
  "INGRESO_BRUTO",
  "EMP_REP_TC_SF",
  "EMP_REP_PP_SF",
  "EMP_REP_CONV_SF",
  "EMP_REP_VEH_SF",
  "EMP_REP_HIP_SF",
  "FLG_TC_SF",
  "FLG_PP_SF",
  "FLG_CONV_SF",
  "FLG_VEH_SF",
  "FLG_HIP_SF",
  "FLG_BANCARIZADO",
  "FLG_CLI_SF",
  "SALDO_TC_SF",
  "SALDO_PP_SF",
  "SALDO_CONV_SF",
  "SALDO_VEH_SF",
  "SALDO_HIP_SF",
  "SALDO_TCSF_UU6",
  "MAX_SALDO_TCSF_U6",
  "MIN_SALDO_TCSF_U6",
  "MAX_LINEA_TCSF",
  "MIN_LINEA_TCSF",
  "LINEA_TOT_TCSF",
  "MAX_SALTC_SF_UM",
  "MIN_SALTC_SF_UM",
  "SALDO_SF_UM",
  "NRO_ENT_REP_TOT_U6",
  "NRO_ENT_REP_SAL_TOT_U6",
  "PORC_ENT_REP_SAL",
  "NRO_ENT_REP_TOT_UM",
  "NRO_ENT_REP_SAL_TOT_UM",
  "IND_EMP_REP_PP_SF",
  "IND_EMP_REP_CONV_SF",
  "IND_EMP_REP_VEH_SF",
  "IND_EMP_REP_HIP_SF",
  "SALDO_TOT_ACT",
  "IND_SAL_TC",
  "IND_SAL_PP",
  "IND_SAL_CONV",
  "IND_SAL_VEH",
  "IND_SAL_HIP",
  "IND_MAX_SAL_TCSF_U6",
  "IND_MIN_SAL_TCSF_U6",
  "IND_MAX_LIN_TCSF",
  "IND_MIN_LIN_TCSF",
  "IND_MAX_SALTC_SF_UM",
  "IND_MIN_SALTC_SF_UM",
  "IND_ENT_REP_U6_SAL",
  "IND_ENT_REP_UM_SAL",
  "IND_MAXLIN_ING",
  "IND_DEU_ING",
  "EDAD",
  "SEXO",
  "SIT_LAB",
  "DEPARTAMENTO",
  "CREC_ENT_REP_TC",
  "CREC_ENT_REP_M13",
  "CREC_ENT_REP_M12",
  "CREC_ENT_REP_SAL_TC",
  "CREC_ENT_REP_SAL_M13",
  "CREC_ENT_REP_SAL_M12",
  "CREC_SAL_TC",
  "CREC_SAL_TC_M13",
  "CREC_SAL_TC_M12",
  "CREC_ENT_REP_PP",
  "CREC_ENT_REP_PP_M13",
  "CREC_ENT_REP_PP_M12",
  "CREC_SALDO_PP",
  "CREC_SALDO_PP_M13",
  "CREC_SALDO_PP_M12",
  "CREC_SAL_VIG_PP",
  "CREC_SAL_VIG_PP_M13",
  "CREC_SAL_VIG_PP_M12",
  "CREC_ENT_REP_CONV",
  "CREC_ENT_REP_CONV_M13",
  "CREC_ENT_REP_CONV_M12",
  "CREC_SALDO_CONV",
  "CREC_SALDO_CONV_M13",
  "CREC_SALDO_CONV_M12",
  "CREC_SAL_VIG_CONV",
  "CREC_SAL_VIG_CONV_M13",
  "CREC_SAL_VIG_CONV_M12",
  "CREC_ENT_REP_VEH",
  "CREC_ENT_REP_VEH_M13",
  "CREC_ENT_REP_VEH_M12",
  "CREC_SALDO_VEH",
  "CREC_SALDO_VEH_M13",
  "CREC_SALDO_VEH_M12",
  "CREC_SAL_VIG_VEH",
  "CREC_SAL_VIG_VEH_M13",
  "CREC_SAL_VIG_VEH_M12",
  "CREC_ENT_REP_HIP",
  "CREC_ENT_REP_HIP_M13",
  "CREC_ENT_REP_HIP_M12",
  "CREC_SALDO_HIP",
  "CREC_SALDO_HIP_M13",
  "CREC_SALDO_HIP_M12",
  "CREC_SAL_VIG_HIP",
  "CREC_SAL_VIG_HIP_M13",
  "CREC_SAL_VIG_HIP_M12",
  "SBS_CLF",
  "TARGET_XF",
  "FLG_TIP_PERSONA"
)]

names(data_tc_nc_3)
str(data_tc_nc$TARGET_XF)

# Market Model

library(C50)
credit_model_tc_nc <- C5.0(data_tc_nc_3[-103], data_tc_nc_3$TARGET_XF)
summary(credit_model_tc_nc)

# Save Model
ls()

getwd()
saveRDS(credit_model_tc_nc, "../4_Objects/credit_model_tc_nc.rds")
# Upload Model
credit_model_tc_nc <- readRDS("../4_Objects/credit_model_tc_nc.rds")

# Create a factor vector of predictions on test data
credit_pred_tc_nc_p <- predict(credit_model_tc_nc,data_tc_nc,type="prob")

head(credit_pred_tc_nc_p[,2])
summary(credit_pred_tc_nc_p)

# Cross tabulation of predicted versus actual classes
library(gmodels)
CrossTable(data_tc_nc_2$TARGET_XF, credit_pred_tc_nc,
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual SELL', 'predicted SELL'))

# Add the first probability (Market probability)

head(credit_pred_tc_nc_p)
prob_market_nc<-credit_pred_tc_nc_p[,2]

# Consolidate matrix with score

head(data_tc_nc)
str(data_tc_nc)

data_tc_nc_2_0<-cbind(data_tc_nc,prob_market_nc)

head(data_tc_nc_2_0)
colnames(data_tc_nc_2_0)

data_tc_nc_2_0_0<-data_tc_nc_2_0[,-190]
head(data_tc_nc_2_0_0)

######### Offer Predictive Model ################

data_tc_nc_2_1 <-data_tc_nc_2_0[c("LINEA_TC","TIPO_FLUJO_TC","IND_VAR_OFERTA_UM",
                                "IND_LINIBK_ING","TARGET_XF","prob_market_nc")]

head(data_tc_nc_2_1)
colnames(data_tc_nc_2_1)
credit_model_tc_nc_1 <- C5.0(data_tc_nc_2_1[-5], data_tc_nc_2_1$TARGET_XF)
summary(credit_model_tc_nc_1)
# Save Model
saveRDS(credit_model_tc_nc_1, "../4_Objects/credit_model_tc_nc_1.rds")
# Upload Model
credit_model_tc_nc_1 <- readRDS("../4_Objects/credit_model_tc_nc_1.rds")

credit_pred2_tc_nc_p <- predict(credit_model_tc_nc_1,data_tc_nc_2_0,type="prob")
prob_offer_nc<-credit_pred2_tc_nc_p[,2]
head(prob_offer_nc)

data_tc_nc_2_2<-cbind(data_tc_nc_2_0,prob_offer_nc)
head(data_tc_nc_2_2)

######### Campaign Predictive Model ################

colnames(data_tc_nc_2_2)
data_tc_nc_2_3 <-data_tc_nc_2_2[c("PROB_CONT","SCORE_CONT","CAMP_TOT","PROM_CAMP",
                                  "RECENCIA_CAMP","NRO_CAMP_TC","CAMP_TC_U6",
                                  "TARGET_XF","FLG_FRESCO","ARRIBO_PJE",
                                  "prob_offer_nc")]
head(data_tc_nc_2_3)

data_tc_nc_2_3[is.na(data_tc_nc_2_3)] <- 0
colnames(data_tc_nc_2_3)

credit_model_tc_nc_2 <- C5.0(data_tc_nc_2_3[-8], data_tc_nc_2_3$TARGET_XF)
summary(credit_model_tc_nc_2)

# Save Model
saveRDS(credit_model_tc_nc_2, "../4_Objects/credit_model_tc_nc_2.rds")
# Upload Model
credit_model_tc_nc_2 <- readRDS("../4_Objects/credit_model_tc_nc_2.rds")

credit_pred3_tc_nc_p <- predict(credit_model_tc_nc_2,data_tc_nc_2_2,type="prob")
prob_camp_nc<-credit_pred3_tc_nc_p[,2]
head(prob_camp_nc)


data_tc_nc_2_3<-cbind(data_tc_nc_2_2,prob_camp_nc)
head(data_tc_nc_2_3)

summary(data_tc_nc_2_3$prob_camp_nc)

head(data_tc_nc_2_3[1])
table(data_tc_nc_2_3$ï..MES_CORTE)

############ Evaluate Predictive Models ##########################
## Tiles Function


#201507 201508 201509 

data_score_201601<-subset(data_tc_nc_2_3, data_tc_nc_2_3$ï..MES_CORTE==201601)
data_score_201602<-subset(data_tc_nc_2_3, data_tc_nc_2_3$ï..MES_CORTE==201602)
data_score_201603<-subset(data_tc_nc_2_3, data_tc_nc_2_3$ï..MES_CORTE==201603)
data_score_201604<-subset(data_tc_nc_2_3, data_tc_nc_2_3$ï..MES_CORTE==201604)

# Decil

data_score_201601_d<-quantile(data_score_201601$prob_camp_nc,prob=seq(0,1,0.1))
data_score_201602_d<-quantile(data_score_201602$prob_camp_nc,prob=seq(0,1,0.1))
data_score_201603_d<-quantile(data_score_201603$prob_camp_nc,prob=seq(0,1,0.1))
data_score_201604_d<-quantile(data_score_201604$prob_camp_nc,prob=seq(0,1,0.1))

str(data_score_201601_d)

data_score_201601_d[2]<-0.01932577

table(data_score_201601$prob_camp_nc)


function_dec <- function(data,x)
{
  x<-c(x,1)
  x<-x[-11]
  A<-length(x)-1 
  B<-dim(data)[1]
  vec<-rep(0,B)
  z<-rep(0,B)
  for(i in 1:B){
    for(j in 1:A) {
      if(data[i,192] >= x[11-j]  & data[i,192]<x[12-j] ){
        vec[i]<-j
        z[i]<-z[i]+1}
    }
  }
  
  return(list(vec=vec))
}

length(data_score_201601_d)
dim(data_score_201601)
colnames(data_score_201601)

data_score_201601_v0<-function_dec(data_score_201601,data_score_201601_d)
data_score_201602_v0<-function_dec(data_score_201602,data_score_201602_d)
data_score_201603_v0<-function_dec(data_score_201603,data_score_201603_d)
data_score_201604_v0<-function_dec(data_score_201604,data_score_201604_d)

head(data_score_201601_v0)
colnames(data_score_201601_v0)

data_score_201601_v1<-cbind(data_score_201601,data_score_201601_v0)
data_score_201602_v1<-cbind(data_score_201602,data_score_201602_v0)
data_score_201603_v1<-cbind(data_score_201603,data_score_201603_v0)
data_score_201604_v1<-cbind(data_score_201604,data_score_201604_v0)

data_score_v01<-rbind(data_score_201601_v1,data_score_201602_v1,data_score_201603_v1,
                      data_score_201604_v1)

colnames(data_score_v01)
head(data_score_v01)
table(data_score_v01$vec)

write.csv(data_tc_nc_2_3,"../5_Out/data_tc_nc_2_3.csv")

# Centil

data_201507_cent<-quantile(data_score_201507$Prob_Pred8,prob=seq(0,1,0.01))
data_201508_cent<-quantile(data_score_201508$Prob_Pred8,prob=seq(0,1,0.01))
data_201509_cent<-quantile(data_score_201509$Prob_Pred8,prob=seq(0,1,0.01))


function_cent <- function(data,x)
{
  x<-c(x,1)
  x<-x[-101]
  A<-length(x)-1 
  B<-dim(data)[1]
  vec<-rep(0,B)
  z<-rep(0,B)
  for(i in 1:B){
    for(j in 1:A) {
      if(data[i,132] >= x[101-j]  & data[i,132]<x[102-j] ){
        vec[i]<-j
        z[i]<-z[i]+1}
    }
  }
  
  return(list(vec=vec))
}



data_score_201507_v2<-function_cent(data_score_201507,data_201507_cent)
data_score_201508_v2<-function_cent(data_score_201508,data_201508_cent)
data_score_201509_v2<-function_cent(data_score_201509,data_201509_cent)

data_score_201507_v3<-cbind(data_score_201507,data_score_201507_v2)
data_score_201508_v3<-cbind(data_score_201508,data_score_201508_v2)
data_score_201509_v3<-cbind(data_score_201509,data_score_201509_v2)

data_score_v02<-rbind(data_score_201507_v3,data_score_201508_v3,data_score_201509_v3)

write.csv(data_score_v02,file=paste0(path_project,"data_score_v02.csv"))

head(data_tc_nc2)
colnames(data_tc_nc2)

data_tc_nc2<-data_tc_nc2[-189]
dim(data_tc_nc2)

write.csv(data_tc_nc2,"data_tc_nc2.csv")
getwd()
