Place the test/train/validation folders with images and the Matlab code files under the same path.
Run 'run.m' to start the program. The script mainly gets the feature points of images in the training set and calculates the dictionary by k-means algorithms from them. In the end 'representation.m', 'classification.m' and 'testsvm.m' are called to show the final results.
'representation.m' computes the represetations of all the images in training/validation/test set.
'classification.m' gives the k-NN classification results. The number of correct classified cases are displayed for each category in validation/test set.
'testsvm.m' shows the results generated by multiclass SVM.