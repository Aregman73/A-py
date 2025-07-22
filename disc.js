function validateInputs(a, b, c) {
  if (isNaN(a)  isNaN(b)  isNaN(c)) {
    console.log("Խնդրում եմ մուտքագրեք ճիշտ թվեր");
    return false;
  }
  return true;
}

function solveEquation(a, b, c) {
  if (a === 0) {
    if (b === 0) {
      if (c === 0) {
        console.log("x պատկանում է (-∞, +∞)");
      } else {
        console.log("Լուծում չունի (0x + c = 0 անհնար է, եթե c ≠ 0)");
      }
    } else {
      let x = -c / b;
      console.log(Պատասխան: x = ${x});
    }
  } else {
    const D = b ** 2 - 4 * a * c;
    solveQuadratic(a, b, D);
  }
}

function solveQuadratic(a, b, D) {
  if (D > 0) {
    let x1 = (-b + Math.sqrt(D)) / (2 * a);
    let x2 = (-b - Math.sqrt(D)) / (2 * a);
    console.log(Պատասխան: x1 = ${x1}, x2 = ${x2});
  } else if (D === 0) {
    let x = -b / (2 * a);
    console.log(Պատասխան: x = ${x});
  } else {
    console.log("Լուծում չկա (դիսկրիմինանտը բացասական է)");
  }
}

// Test cases:
const testCases = [
  [1, 4, 2],
  [1, 4, 4],
  [3, 1, 4],
  [2, 4, 0],
  [4, 0, 4],
  [0, 4, 1],
  [0, 0, 0],
];

for (const [a, b, c] of testCases) {
  console.log(\nԼուծում ${a}x² + ${b}x + ${c} = 0-ի համար);
  if (validateInputs(a, b, c)) {
    solveEquation(a, b, c);
  }
}
