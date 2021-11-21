FROM warfare_in_the_latin_east_bedrock_asiaminor:latest

WORKDIR /latineast

COPY anatolia anatolia/
COPY balkans balkans/
COPY central_europe central_europe/
COPY cyprus cyprus/
COPY europe_anatolia europe_anatolia/
COPY europe_mediterranean europe_mediterranean/
COPY levant levant/
COPY levant_anatolia levant_anatolia/
COPY niledelta niledelta/

CMD echo 'Bedrock for Asia Minor'
