# Logic:

## Steps:
1. Load the Features Table.
2. Make the vector with only the std/mean values (use the grep function)
3. Load the Activities Labels including change the format of the names.
4. Load the Train Measure Data with only the features selected (std/mean).
5. Load the Activities associated of the Train Set.
6. Load Subjects Data of the Train Set.
7. Load the Test Measure Data with only the features selected.
8  Load the Activities associated of the Test Set.
9. Load Subjects Data of the Test Set.
10. Make the partial columns which they will be include in the final data.frame.
11. Assign correct names to the columns.
12. Merge train_data with test_data 
13. Tidy Data (group by Activity Id, SubjectId) (using the aggregate function)
14. Prepare the Final Presentation, including the Activity Name.
15. Make the output file.

## Cook Book
1. features: Features Data.
2. features_columns_selected: Features with mean/std
3. features_names: Names of the Features Selected.
4. act_labels: Names of the Activity Labels.
5. train_mea_data: Train Data (Measure Value)
6. train_act_data:  Train Data (Activity of the Measure)
7. train_sbj_data: Train Data (Subject of the Measure)
5. test_mea_data: Test Data (Measure Value)
6. test_act_data:  Test Data (Activity of the Measure)
7. test_sbj_data: Test Data (Subject of the Measure)
8. vector_measure: Train plus Test Data (Measure)
9. vector_activity: Train plus Test Data (Activity)
10. vector_subject: Train plus Test Data (Subject)
11. full_data: Final set (all consolidated)
12. tidy_data: Grouped Set (by Activity Id, Subject Id)
13. final_full_data: All set including the Activity Name.
14. final_tidy_data: Grouped Set (by Activity Id, Subject Id) including Activity Name
