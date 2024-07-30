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