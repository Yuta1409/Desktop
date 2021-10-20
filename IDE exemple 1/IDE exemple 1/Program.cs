/** 
 * Jeu du nombre caché 
 * author : gay
 * date : 06/10/2021 
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDE_exemple_1
{
    class Program
    {
        static void Main(string[] args)
        {
            //déclaration
            int valeur, essai, nbre = 1;

            //saisie du nombre à chercher
            Console.Write("Entrez le nombre à chercher = ");
            valeur = int.Parse(Console.ReadLine());
            Console.Clear();
            Console.ReadLine();

            //saisie du premier essai
            Console.Write("Entrez un essai = ");
            essai = int.Parse(Console.ReadLine());
            while (essai != valeur)
            {
                // test de l'essai par rapport à la valeur à chercher
                if (essai > valeur)
                {
                    Console.WriteLine(" --> trop grand !");
                }
                else
                {
                    Console.WriteLine(" --> trop petit !");
                }
                // saisie d'un nouvel essai
                Console.Write("Entrez un essai = ");
                essai = int.Parse(Console.ReadLine());
                //compteur d'essais
                nbre++;
            }
            //valeur trouvée
            Console.WriteLine("vous avez trouvé en" + " "+ nbre + " " + "fois !");
            Console.ReadLine(); 
        }
    }
}
