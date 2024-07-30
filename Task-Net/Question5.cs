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