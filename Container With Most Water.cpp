//question link: https://leetcode.com/problems/container-with-most-water/
//Please consider this under hacktober fest

class Solution {
public:
    int maxArea(vector<int>& height) {
    int ptr1=0; 
    int ptr2=height.size()-1;
    int max_area = min(height[ptr1],height[ptr2])*(ptr2-ptr1);
        
        while(ptr2>ptr1){
            if(height[ptr1]>height[ptr2]){
                ptr2--;
            }
            else{
                ptr1++;
            }
            max_area=max(min(height[ptr1],height[ptr2])*(ptr2-ptr1), max_area);
        }
        return max_area;
    }
};




/*
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.


Input: height = [1,1]
Output: 1


Input: height = [4,3,2,1,4]
Output: 16
*/
