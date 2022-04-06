SELECT        CF.claimcontrol_id, CF.claimant_num, CF.claimfeature_num, CF.exposure_dscr, CF.subexposure_dscr, CF.coverage_dscr, CF.subcoverage_dscr, CF.record_only, CF.in_suit, CF.statute_of_limitations_date,
                         Users_In.display_name AS inside_adjuster, Users_Out.display_name AS outside_adjuster, CFS.dscr AS status_dscr, CFN.initial_indemnity_reserve, CFN.indemnity_reserve, CFN.indemnity_paid, CFN.initial_expense_reserve,
                         CFN.expense_reserve, CFN.expense_paid, CFN.alae_reserve, CFN.alae_paid, CFN.initial_anticipated_expense_recovery, CFN.anticipated_expense_recovery, CFN.expense_recovery, CFN.initial_anticipated_salvage,
                         CFN.anticipated_salvage, CFN.salvage, CFN.initial_anticipated_subro, CFN.anticipated_subro, CFN.subro, CFN.initial_anticipated_other_recovery, CFN.anticipated_other_recovery, CFN.other_recovery,
                         CFS.claimfeaturestatus_id, Prsnl_In.claimpersonnel_id, Users_In.display_name, Prsnl_In.users_id, CF.claimdenialreason_id, CF.claimdenialusers_id, CF.claimdenialreason_remarks, CF.denied, CF.claimdenial_date,
                         CC.coveragecode_id, ISNULL(CSC.subcoveragecode_id, 0) AS subcoveragecode_id, CCov.coveragecode, CF.claimexposure_id, CF.claimsubexposure_num, CF.claimcoverage_num, CF.claimsubcoverage_num
FROM            dbo.ClaimFeature AS CF INNER JOIN
                         dbo.ClaimCoverage AS CC WITH (NOLOCK) ON CF.claimcontrol_id = CC.claimcontrol_id AND CF.claimexposure_id = CC.claimexposure_id AND CF.claimsubexposure_num = CC.claimsubexposure_num AND
                         CF.claimcoverage_num = CC.claimcoverage_num INNER JOIN
                         dbo.CoverageCode AS CCov WITH (NOLOCK) ON CCov.coveragecode_id = CC.coveragecode_id LEFT OUTER JOIN
                         dbo.ClaimSubCoverage AS CSC WITH (NOLOCK) ON CF.claimcontrol_id = CSC.claimcontrol_id AND CF.claimexposure_id = CSC.claimexposure_id AND CF.claimsubexposure_num = CSC.claimsubexposure_num AND
                         CF.claimcoverage_num = CSC.claimcoverage_num AND CF.claimsubcoverage_num = CSC.claimsubcoverage_num INNER JOIN
                         dbo.ClaimFinancials AS CFN ON CF.claimcontrol_id = CFN.claimcontrol_id AND CF.claimfinancials_num = CFN.claimfinancials_num INNER JOIN
                         dbo.ClaimFeatureStatus AS CFS ON CF.claimfeaturestatus_id = CFS.claimfeaturestatus_id INNER JOIN
                         dbo.ClaimFeaturePersonnel AS FtrPrsnl_In ON CF.claimcontrol_id = FtrPrsnl_In.claimcontrol_id AND CF.claimant_num = FtrPrsnl_In.claimant_num AND CF.claimfeature_num = FtrPrsnl_In.claimfeature_num AND
                         FtrPrsnl_In.claimpersonneltype_id = 3 AND FtrPrsnl_In.claimadjustertype_id = 1 INNER JOIN
                         dbo.ClaimPersonnel AS Prsnl_In ON FtrPrsnl_In.claimpersonnel_id = Prsnl_In.claimpersonnel_id INNER JOIN
                         dbo.vUsers AS Users_In ON Prsnl_In.users_id = Users_In.users_id INNER JOIN
                         dbo.ClaimFeaturePersonnel AS FtrPrsnl_Out ON CF.claimcontrol_id = FtrPrsnl_Out.claimcontrol_id AND CF.claimant_num = FtrPrsnl_Out.claimant_num AND CF.claimfeature_num = FtrPrsnl_Out.claimfeature_num AND
                         FtrPrsnl_Out.claimpersonneltype_id = 3 AND FtrPrsnl_Out.claimadjustertype_id = 2 INNER JOIN
                         dbo.ClaimPersonnel AS Prsnl_Out ON FtrPrsnl_Out.claimpersonnel_id = Prsnl_Out.claimpersonnel_id INNER JOIN
                         dbo.vUsers AS Users_Out ON Prsnl_Out.users_id = Users_Out.users_id
