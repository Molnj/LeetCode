/*******************************************************************************
* 26 -
*******************************************************************************/



void merge(int* nums1, int nums1Size, int m, int* nums2, int nums2Size, int n) {
    // Start from the end of the merged arrays
    int idx1 = m-1;
    int idx2 = n-1;

    // Merge nums1 and nums2
    for (int i = m+n-1; i >= 0; i--) {
        if (idx1 >= 0 && (idx2 < 0 || nums1[idx1] > nums2[idx2])) {
            nums1[i] = nums1[idx1--];
        } else {
            nums1[i] = nums2[idx2--];
        }
    }
}

int main(void) {


    return 0;
}