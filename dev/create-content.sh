ACTION=$1;
SLUG=$2

post() {
  hugo new content content/posts/${1}.md --kind post
}

author() {
  hugo new content content/community/engage/people/${1}.md --kind author  
}

$ACTION $SLUG