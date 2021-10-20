using System;

namespace Exercice_3_Calcul_arithmétique
{
    class Program
    {
        static void Main(string[] args)
        {
            float somme;
            int nbNotes;
            
            somme = float.Parse(Console.ReadLine());
            nbNotes = int.Parse(Console.ReadLine());
            Console.WriteLine("Votre moyenne est" + somme / nbNotes + ".");
            Console.WriteLine($"Votre moyenne est {somme / nbNotes}.");

        }
    }
}
