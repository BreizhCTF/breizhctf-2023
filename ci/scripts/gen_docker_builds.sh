#!/usr/bin/env bash

# set -xe

# Première phase :
# Recherche les images de bases docker, puis génère des jobs gitlab-ci

echo 'include: ci/jobs/.build-docker.gitlab-ci.yml'

cat <<EOF
workflow:
  rules:
    - when: always
EOF

for folder in docker/*
do

  cat <<EOF
Build $(basename $folder):
  extends: .build_docker
  rules:
    - changes:
      - ${folder}/**/*
  variables:
    FOLDER: ${folder}
    NAME: base-${folder}
EOF

done

# Deuxième phase :
# Recherche des challenges avec un Dockerfile, puis génère des jobs gitlab-ci

for folder in challenges/*/*
do
  # dockerfile=$(find ${folder} -name Dockerfile)
  challenge=$(basename ${folder})

  find $folder -name '*Dockerfile' | while read dockerfile
  do
    if [[ "$(basename $dockerfile)" == "Dockerfile" ]]
    then
      image_name="${challenge,,}"
    else
      dockerfile_filename="$(basename $dockerfile)"
      image_name="${challenge,,}-${dockerfile_filename%.Dockerfile}"
    fi

    cat <<EOF
Build ${image_name}:
  extends: .build_docker
  variables:
    FOLDER: $(dirname ${dockerfile})
    DOCKERFILE: ${dockerfile}
    NAME: ${image_name}
  rules:
    - changes:
      - $(dirname ${dockerfile})/**/*
EOF

    # Si le challenge utilise une image de base,
    # alors il faut rebuild le challenge quand l'image de base est modifiée
    content=$(cat $dockerfile)
    if [[ $content =~ FROM.+/base-docker/([a-z\-]+) ]]
    then

      cat <<EOF
    - changes:
      - docker/${BASH_REMATCH[1]}/**/*
  needs:
    - job: Build ${BASH_REMATCH[1]} # Attendre le build de l'image de base
      optional: true # Nécessaire dans le cas ou l'image de base n'a pas été modifiée
EOF
    fi
    echo

  done
done


# C'est dégeulasse, mais gitlab n'accepte pas qu'il y ait des pipeline "vides"
# Ce job ne fait rien du tout et ne consomme rien du tout, mais ca règle le caprice de gitlab :')
cat <<EOF
Empty job:
  variables:
    GIT_STRATEGY: none
  script:
    - echo This job does nothing
EOF
