#include <iostream>
#include <cmath>

void solveQuadratic(double a, double b, double D) {
    if (D > 0) {
        double x1 = (-b + std::sqrt(D)) / (2 * a);
        double x2 = (-b - std::sqrt(D)) / (2 * a);
        std::cout << "Պատասխան: x1 = " << x1 << " x2 = " << x2 << std::endl;
    } else if (D == 0) {
        double x = -b / (2 * a);
        std::cout << "Պատասխան: x = " << x << std::endl;
    } else {
        std::cout << "Լուծում չկա (դիսկրիմինանտը բացասական է)" << std::endl;
    }
}

void solveEquation(double a, double b, double c) {
    if (a == 0) {
        if (b == 0) {
            if (c == 0) {
                std::cout << "x պատկանում է (-∞, +∞)" << std::endl;
            } else {
                std::cout << "Լուծում չունի (0x + c = 0 անհնար է, եթե c ≠ 0)" << std::endl;
            }
        } else {
            double x = -c / b;
            std::cout << "Պատասխան: x = " << x << std::endl;
        }
    } else {
        double D = b * b - 4 * a * c;
        solveQuadratic(a, b, D);
    }
}

int main() {
    double testCases[][3] = {
        {1, 4, 2},     // D > 0
        {1, 2, 1},     // D == 0
        {1, 2, 3},     // D < 0
        {0, 4, -8},    // Linear
        {0, 0, 0},     // Infinite solutions
        {0, 0, 5},     // No solution
        {-1, 2, -1},   // D == 0
        {2, -7, 3}     // D > 0
    };

    int numTests = sizeof(testCases) / sizeof(testCases[0]);

    for (int i = 0; i < numTests; ++i) {
        double a = testCases[i][0];
        double b = testCases[i][1];
        double c = testCases[i][2];

        std::cout << "\nԹեստ #" << (i + 1) << ": ";
        std::cout << a << "x² + " << b << "x + " << c << " = 0" << std::endl;

        solveEquation(a, b, c);
    }

    return 0;
}

