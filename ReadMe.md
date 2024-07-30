# Documentation 

## How to use

### SQL Task
If you want to create the table first and fill it with data uncomment the following code:

Question1:
```sql
CREATE TABLE BARANG (
    KODEBRG INT PRIMARY KEY,
    NAMABRG VARCHAR(50)
);

CREATE TABLE JUAL (
    KODEBRG INT,
    JUMLAH INT,
    FOREIGN KEY (KODEBRG) REFERENCES BARANG(KODEBRG)
);

INSERT INTO BARANG (KODEBRG, NAMABRG) VALUES
(1, 'MEJA'),
(2, 'KURSI'),
(3, 'LAMPU');

INSERT INTO JUAL (KODEBRG, JUMLAH) VALUES
(1, 2),
(1, 3),
(2, 4);
```
Question2:

```sql
CREATE TABLE HistoriStokBarang (
    KodeStok 		INT PRIMARY KEY,
    Tanggal 		DATE,
    KodeBarang 	CHAR(1),
    StokAkhir 	INT
);

INSERT INTO HistoriStokBarang (KodeStok, Tanggal, KodeBarang, StokAkhir) VALUES
(1, '2009-01-01', 'A', 2),
(2, '2009-01-02', 'A', 5),
(3, '2009-01-02', 'B', 1),
(4, '2009-01-03', 'A', 3),
(5, '2009-01-03', 'B', 3),
(6, '2009-01-04', 'A', 5),
(7, '2009-01-04', 'A', 4);

SELECT * FROM historistokbarang

```

### Task-Net
Go to directory of the Task-Net then open terminal and type `dotnet run`.



## Answer
Question1.sql:
```sql
SELECT 	BARANG.KODEBRG,
				BARANG.NAMABRG,
        COALESCE(SUM(JUAL.JUMLAH), 0) AS JML_JUAL
FROM		BARANG
LEFT JOIN		JUAL ON BARANG.KODEBRG = JUAL.KODEBRG
GROUP BY		BARANG.KODEBRG, BARANG.NAMABRG
ORDER BY 		KODEBRG ASC

```

Question2.sql:

```sql
SELECT		    HS.KODEBARANG,
		        HS.STOKAKHIR
FROM 			historistokbarang HS
JOIN			(
						SELECT 		KODEBARANG,
  									MAX(TANGGAL) AS TanggalTerbaru
						FROM 		historistokbarang
  					    GROUP BY 	KODEBARANG
				) TERBARU_T ON HS.KODEBARANG = TERBARU_T.KODEBARANG AND HS.TANGGAL = TERBARU_T.TanggalTerbaru
JOIN			(
					SELECT		KODEBARANG,
  								TANGGAL,
  								MAX(KODESTOK) AS StokTerbaru
  					FROM		historistokbarang
  					GROUP BY	KODEBARANG, TANGGAL
				) TERBARU_S ON HS.KODEBARANG = TERBARU_S.KODEBARANG AND HS.TANGGAL = TERBARU_S.TANGGAL AND HS.KODESTOK = TERBARU_S.StokTerbaru
ORDER BY	    HS.KODEBARANG
```
### Step-by-Step Explanation

1. **Subquery to Find Latest Date per `KodeBarang`**:
   - Find the latest date for each `KodeBarang`.
   
2. **Another Subquery to Find the Latest `KodeStok` within the Latest Date**:
   - Find the latest `KodeStok` for each `KodeBarang` within the latest date.

3. **Join with the Main Table**:
   - Join the result back to the original table to get the corresponding `StokAkhir`.



1. **First Subquery**:
   ```sql
    SELECT 		KODEBARANG,
  				MAX(TANGGAL) AS TanggalTerbaru
    FROM 		historistokbarang
    GROUP BY 	KODEBARANG
   ```
   - This subquery selects each `KodeBarang` and finds the maximum `Tanggal` for each item.

2. **Second Subquery**:
   ```sql
    SELECT		KODEBARANG,
  				TANGGAL,
  				MAX(KODESTOK) AS StokTerbaru
  	FROM		historistokbarang
  	GROUP BY	KODEBARANG, TANGGAL
   ```
   - This subquery selects each `KodeBarang` and `Tanggal`, and finds the maximum) `KodeStok` for each item on that date.


Question3.cs:

```csharp
using System;
using System.Collections.Generic;

public class Question3
{
    public static void Run()
    {
        Console.Write("Input: ");
        int input = int.Parse(Console.ReadLine());

        List<int> fib = GenerateFibonacci(input);
        Console.WriteLine(string.Join(" ", fib));
    }

    private static List<int> GenerateFibonacci(int limit)
    {
        List<int> sequence = [1, 1];

        while (sequence[^1] + sequence[^2] <= limit)
        {
            sequence.Add(sequence[sequence.Count - 1] + sequence[sequence.Count -2]);
        }

        return sequence;
    }
}
```

Question4.cs:

```csharp
using System;

public class Question4
{
    public static void Run()
    {
        Console.Write("Input: ");
        int input = int.Parse(Console.ReadLine());

        for (int i = 0; i < input; i++)
        {
            string stars = new string('*', 2 * i + 1);

            Console.WriteLine(stars);
        }
    }
}
```

Question5.cs:

```csharp
using System;

public class Question5
{
    public static void Run()
    {
        Console.Write("Input1: ");
        int input = int.Parse(Console.ReadLine());

        Console.Write("Input2: ");
        int input2 = int.Parse(Console.ReadLine());

        string result = input.ToString().PadLeft(input2, '0');
        Console.WriteLine(result);
    }
}
```

In the main method, we'll create an instance of each class and call its Run method.

```csharp
using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Question 3:");
        Question3.Run();

        Console.WriteLine("\nQuestion 4:");
        Question4.Run();

        Console.WriteLine("\nQuestion 5:");
        Question5.Run();
    }
}
```


## Explanation
Question 3: Fibonacci Sequence

Task:
This problem asks us to generate a Fibonacci sequence up to a given limit. The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 1 and 1.

Key points in the implementation:
1. I'm start with a list containing [1, 1].
2. Then I keep adding numbers to the list, where each new number is the sum of the last two.
3. At some point, the code will stop when the next number would exceed the input limit.
4. I'm use a while loop to keep generating numbers until reach the limit.


Question 4: Pyramid Pattern

Technical Explanation:
This problem asks us to print a pattern of asterisks (*) that forms a pyramid shape. The number of asterisks in each row follows the sequence: 1, 3, 5, 7, ...

Key points in the implementation:
1. I'm use a for loop to iterate through each row.
2. For each row, the code will calculate the number of stars as 2 * rowNumber + 1 (2*n + 1).
3. Using string multiplication (new string('*', count)) to create the string of stars.
4. After that, I print each row of stars on a new line.


Question 5: Number Padding

Task:
This problem asks us to pad a number with leading zeros to reach a specified width.

Key points in the implementation:
1. Taking two inputs: the number to pad and the desired width.
2. After that convert the number to a string.
3. Utilizing string methods, PadLeft() method to add leading zeros until the string reaches the desired width.
4. If the number is already longer than the specified width, it remains unchanged.

