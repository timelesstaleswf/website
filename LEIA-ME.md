# Timeless Tales, alterações feitas

Substitui os 4 ficheiros HTML e o `sitemap.xml` no servidor. Nada mais mudou.

## O que mudou

### index.html
- **Portfolio subiu para logo a seguir ao hero**, antes do About. É a primeira coisa depois do título.
- **Passou de 4 para 8 filmes.** A home mostra agora o portfolio completo.
- **Menu reordenado:** Portfolio, Collections, All Films, Destination Weddings, Wedding Venues, Contact. Os venues continuam lá, mas deixaram de ser a primeira coisa que se vê.
- Botão do hero: "View Portfolio" passou a "Watch the Films".
- **Players Vimeo em modo facade.** Antes, 4 players carregavam com a página. Agora carrega só a imagem estática e o player entra quando alguém clica em play. Com 8 filmes na home isto era obrigatório.
- **Schema de vídeo (VideoObject)** adicionado para os 8 filmes.
- **Formulário reescrito** com honeypot anti-spam, estado de envio e suporte a endpoint real. Ver "O que tens de fazer" abaixo.

### destination-wedding-films.html
- Mesmo tratamento de facade nos 8 players e schema de vídeo.
- **FAQ reescrita.** Tinha 4 perguntas iguais às da página destination-weddings, o que anulava o rich result nas duas. Agora esta página responde só a perguntas de produção: diferença entre feature film e highlights, gravação de votos e discursos, prazos de entrega, música, drone, pagamento, conhecimento dos venues.

### destination-weddings.html
- **Link corrigido.** "See our curated guide to wedding venues in Portugal" apontava para a página de filmes. Agora vai para `wedding-venues.html`.
- Removida a pergunta sobre prazo de entrega do filme, que passou para a página de filmes.

### wedding-venues.html
- **ItemList duplicado consolidado.** Havia dois blocos, um vazio com `numberOfItems: 35` e outro com os 35 venues. Ficou um só, completo.

### sitemap.xml
- Removidas as tags `priority`, que o Google ignora desde 2017.

---

## O que tens de fazer (2 coisas)

### 1. Ligar o formulário (15 minutos)

Cria conta em [Formspree](https://formspree.io) ou [Basin](https://usebasin.com), copia o endpoint e cola no `index.html`, procura por:

```js
const FORM_ENDPOINT = '';
```

Fica assim:

```js
const FORM_ENDPOINT = 'https://formspree.io/f/xxxxxxx';
```

Enquanto estiver vazio, o formulário continua a abrir o cliente de email como antes. Nada parte.

### 2. Nomes reais nos filmes

Nos dois ficheiros com portfolio, procura `Film 01`. Cada legenda está assim:

```html
<span class="names">Film 01</span><span class="tag">Destination Wedding &middot; Portugal</span>
```

Muda para:

```html
<span class="names">Anna &amp; Luke</span><span class="tag">Quinta de Sant'Ana &middot; Lisbon</span>
```

Faz o mesmo no bloco de schema de vídeo no topo de cada ficheiro, onde diz `"name": "Wedding Film 01..."`.

E acrescenta a cada VideoObject as duas linhas que faltam para teres thumbnails de vídeo na Google (ambas estão no teu painel do Vimeo):

```json
"uploadDate": "2025-09-14",
"thumbnailUrl": "https://i.vimeocdn.com/video/xxxxxxxxx-1280.jpg",
```

---

## Depois de publicares

Corre o `indexnow-submit.sh` para o Bing e Yandex reindexarem. Para a Google, pede reindexação das 4 páginas na Search Console.
