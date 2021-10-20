using System;

namespace Exercice_5
{
    class Program
    {
        static void Main(string[] args)

        {
            int age = 1;
            int majeur = 18;

            while(age!= 0 )
            {
                age = int.Parse(Console.ReadLine());
                if (age >= 18)
                {
                    Console.Write("Ouf... vous êtres majeur");
                }
                else
                {
                    Console.Write($"vous serez majeur dans {majeur - age} ans ");
                }
            }
            Console.ReadLine();
        }
    }
}
