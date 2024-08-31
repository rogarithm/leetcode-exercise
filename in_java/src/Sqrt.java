class MySqrt {
    public int mySqrt(int x) {
        int left = 0;
        int right = x;

        while (left <= right) {
            int mid = (left + right) / 2;
            long midSum = mid * mid;
            if (midSum == x) {
                return mid;
            }
            if (midSum < x) {
                left = mid + 1;
            }
            if (midSum >= x) {
                right = mid - 1;
            }
        }
        return right;
    }
}