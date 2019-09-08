![logo](https://user-images.githubusercontent.com/29904893/64489312-096a5880-d228-11e9-8bc8-75d3706d6e21.png)


# Introdução

* Desenvolvida no ano 2000 por um time de desenvolvedores da Microsoft liderada por Anders Hejlsberg.
* Faz parte da plataforma .NET
  * Plataforma única de desenvolvimento e execução de sistemas e aplicações. Todo e qualquer código gerado para .NET pode ser executado em qualquer dispositivo que possua tal framework.
* Baseado em linguagens como C, C++, JAVA e VB.
* Possui código fonte compilado para Common Intermediate Language (CIL) e que é interpretada pela máquina virtual Common Language Runtime(CLR).

# Classificação

* Orientada a objeto.
* Fortemente tipada.
* Fácil de aprender mas complexa.
*Linguagem de propósito geral.
  * Desenvolvimento de jogos. 
  * Desenvolvimento Web.
  * Desenvolvimento Mobile.
  * IoT.
  * entre outros...
# Funcionalidade: Garbage Collector.
É um recurso que oferece o gerenciamento de memória. Com ele é possível recuperar uma área inutilizada por um programa,evitando problemas de vazamento. Em linguagens que não tem o GC como C e C++, a memória dinâmica é alocada e desalocada explicitamente. No caso do C#, toda vez que você cria um novo objeto, o CLR aloca memória para ele. Quando não há nenhuma referência à esse objeto, o GC recupera a parte da memória que estava sendo usada, o que pode ocasionar no esgotamento da memória livre para alocação.<br /><br />
O GC é responsável por rodar seu próprio thread e sua execução é realizada de tempos em tempos, determinada pelo .NET Framework. Durante o processo de execução do GC, os outros threads que estiverem sendo executados na aplicação ficarão parados temporariamente. Isso porque o GC pode precisar mover objetos e atualizar referências de objetos. Vale salientar que o GC não pode realizar estas tarefas enquanto os objetos estiverem sendo usados.

# Código em C#.

![C#_cdg](https://user-images.githubusercontent.com/29904893/64489526-a0381480-d22a-11e9-868e-7811a6f3781f.PNG)

# Output.
![C#_output](https://user-images.githubusercontent.com/29904893/64489537-e3928300-d22a-11e9-9577-6cdf1608d428.PNG)

# Código em C++.

![C++_cdg](https://user-images.githubusercontent.com/29904893/64489574-5bf94400-d22b-11e9-9b1f-c658bc94072a.PNG)

# Output.

![C++_output](https://user-images.githubusercontent.com/29904893/64489584-70d5d780-d22b-11e9-950e-5f8152fcc677.PNG)

# Funcionalidade: Async/Await.
Para podermos fazer tarefas simultaneamente, sem que o nosso programa pare e aguarde cada tarefa ser finalizada para realizar a próxima tarefa, temos que usar funções assíncronas. Como por exemplo, quando fazemos uma requisição a algum serviço web, ela certamente é mais demorada que qualquer operação local, e se ela for feita de maneira síncrona a página ficará congelada enquanto a resposta não chegar. Cada linguagem tem uma maneira diferente de implementar o assincronismo, e o C# utiliza Tasks e Async/Await.

![programming_models](https://user-images.githubusercontent.com/29904893/64489709-957e7f00-d22c-11e9-832a-59ec148bb74c.png)

![C#_async](https://user-images.githubusercontent.com/29904893/64489956-e000fb00-d22e-11e9-8f62-6ea0ecd47b96.jpeg)

# Output.

![outputAsyncAwait](https://user-images.githubusercontent.com/29904893/64489725-ceb6ef00-d22c-11e9-9c67-4a76e5993777.png)

# Referências.

1.  https://medium.com/sololearn/why-is-c-among-the-most-popular-programming-languages-in-the-world-ccf26824ffcb
2.  https://www.youtube.com/watch?v=NXVQasys0B8
3.  https://www.quora.com/Where-is-C-used
4.  https://www.codingame.com/playgrounds/4240/your-ultimate-async-await-tutorial-in-c/introduction
5.  https://docs.microsoft.com/pt-br/dotnet/standard/garbage-collection/fundamentals
6.  https://www.codingame.com/playgrounds/6179/garbage-collection-and-c
7.  https://docs.microsoft.com/pt-br/dotnet/api/system.gc?view=netframework-4.8
8.  https://www.devmedia.com.br/garbage-collection-entendendo-e-otimizando-parte-1/24082
9.  https://www.geeksforgeeks.org/linked-list-implementation-in-c-sharp/
10. https://www.codementor.io/codementorteam/a-comprehensive-guide-to-implementation-of-singly-linked-list-using-c_plus_plus-ondlm5azr


