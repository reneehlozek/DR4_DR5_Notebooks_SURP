#!/bin/bash

alias wgetncc='wget --no-check-certificate' 

# ~~~~~~~ Derived Maps ~~~~~~~~~
# Temporarily get them from act-1
echo "get lensing maps"
wgetncc https://phy-act1.princeton.edu/staged/zatkins/act_planck_dr4.01_s14s15_D56_lensing_kappa_baseline.fits

echo "get component separated maps"
wgetncc https://phy-act1.princeton.edu/staged/zatkins/tilec_single_tile_deep56_comptony_map_v1.2.0_joint.fits
wgetncc https://phy-act1.princeton.edu/staged/zatkins/tilec_single_tile_deep56_cmb_map_v1.2.0_joint.fits
wgetncc https://phy-act1.princeton.edu/staged/zatkins/tilec_single_tile_deep56_cmb_deprojects_comptony_map_v1.2.0_joint.fits

# ~~~~~~~~~ Cosmo Results ~~~~~~~~~~

wgetncc https://phy-act1.princeton.edu/staged/zatkins/ACTPol_lcdm_1.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/ACTPol_lcdm.paramnames


# ~~~~ Ancillary Data Products ~~~~~~~~`
echo "getting masks"
wget --show-progress -O act_dr4.01_masks.tar.gz https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz

echo "extract files"
tar -xf act_dr4.01_masks.tar.gz masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits
tar -xf act_dr4.01_masks.tar.gz masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D56_apo_w0.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D6_apo_w0.fits

echo "move masks"
mv masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits ./act_dr4.01_s14s15_D56_lensing_mask.fits
mv masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits ./act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
mv masks/footprints/act_dr4.01_D56_apo_w0.fits ./act_dr4.01_D56_apo_w0.fits
mv masks/footprints/act_dr4.01_D6_apo_w0.fits ./act_dr4.01_D6_apo_w0.fits

rm act_dr4.01_masks.tar.gz
rm -r masks

echo "getting window function"
wget --show-progress -O act_dr4.01_window_functions.tar.gz  https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_window_functions.tar.gz 

echo "extract files"
tar -xf act_dr4.01_window_functions.tar.gz  window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt

echo "move window function"
mv window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt ./act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt
rm act_dr4.01_window_functions.tar.gz
rm -r window_functions

# ~~~~~~~~ s15 Maps ~~~~~~~~~~~~~
echo " getting the source free maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_map_srcfree.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

echo "Getting the Source maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_srcs.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_srcs.fits

echo "Getting the inverse variance maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_ivar.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits

# ~~~~~~~~ s13 Maps ~~~~~~~~~~~~~~~
echo "getting the season 13 inverse variance maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_set{0..3}_ivar.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits

echo "getting the season 13 source free maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_set{0..3}_map_srcfree.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

# ~~~~~~~ Non ACT Products ~~~~~~~~
echo "Get the Planck map and CMASS galaxy catalog"
wget https://irsa.ipac.caltech.edu/data/Planck/release_2/all-sky-maps/maps/HFI_SkyMap_143_2048_R2.02_full.fits
wget https://data.sdss.org/sas/dr12/boss/lss/galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz && gunzip ./galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz

# ~~~~~~~ ACT Cluster catalog ~~~~~~
echo "Get a cluster catalog"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/actpol_2016_lensing/E-D56Clusters.fits

# ~~~~~~~~ Sims ~~~~~~~~~~~~~~~~~~
wgetncc https://phy-act1.princeton.edu/staged/zatkins/act_dr4.01_s15_D56_pa1_coadd_est_True_covsqrt.fits

# ~~~~~~ Notebook Ancillary Products ~~~~~~~~~~~~~

echo "get the coadd maps"
wgetncc https://phy-act1.princeton.edu/staged/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_d56_I.fits
wgetncc https://phy-act1.princeton.edu/staged/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_dg_I.fits

wgetncc https://phy-act1.princeton.edu/staged/zatkins/messier_objs.csv
wgetncc https://phy-act1.princeton.edu/staged/zatkins/camb_theory.dat


wgetncc https://phy-act1.princeton.edu/staged/zatkins/BIN_ACTPOL_50_4_SC_low_ell
wgetncc https://phy-act1.princeton.edu/staged/zatkins/ACTPol_lcdm.paramnames.csv
wgetncc https://phy-act1.princeton.edu/staged/zatkins/section_9_covsqrt.fits
wgetncc https://phy-act1.princeton.edu/staged/zatkins/auto_cov_TTTT.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/cross_cov_TTT.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/TT_cross_spectra.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/deep56_TT_spectrum.txt
wgetncc -r -np -R "index.html*" https://phy-act1.princeton.edu/staged/zatkins/mcm






