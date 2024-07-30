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