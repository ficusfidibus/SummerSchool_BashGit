#!/bin/bash

## just for the sake of some changes

# Define an array of dishes with their ingredients
declare -A dishes
dishes=(
  ["Burrito"]="tortilla rice beans cheese salsa"
  ["Lasagna"]="pasta sheets tomato sauce ground beef creme cheese mozzarella cheese red wine basil"
  ["Pasta"]="pasta olive oil grana padano tomatoes basil red wine"
  ["Seafood_Pasta"]="pasta olive oil seafood tomatoes grana padano basil white wine optional garlic"
  ["Focaccia"]="flour yeast olive oil rosemary pine nuts grana padano basil garlic mozzarella cheese prosciutto arugula tomato"
  ["Thai_Curry"]="coconut milk bell peppers broccoli carrots rice ginger corn tomato tomato sauce"
  ["Ammunition_Soup"]="coconut milk white beans red beans chickpeas broccoli peas corn"
  ["Couscous_Pfanne"]="couscous mushrooms tomatoes carrots grana padano broccoli or zucchini"
  ["Buckwheat_Mushrooms"]="buckwheat mushrooms tomatoes carrots grana padano"
  ["Spinach_Pasta"]="pasta spinach grana padano fresh cheese or sheep cheese"
)

# Function to display a dish
display_dish() {
  local dish=$1
  echo "$dish: Ingredients are ${dishes[$dish]}."
}

# Function to get dishes for the week
get_dishes_for_the_week() {
  local n=$1
  local selected_dishes=()
  local shopping_list=()

  if (( n > ${#dishes[@]} )); then
    echo "Not enough unique dishes to cover all days, some dishes will be repeated."
    for ((i = 0; i < n; i++)); do
      selected_dishes+=($(echo ${!dishes[@]} | tr ' ' '\n' | shuf -n 1))
    done
  else
    selected_dishes=($(echo ${!dishes[@]} | tr ' ' '\n' | shuf -n $n))
  fi

  for dish in "${selected_dishes[@]}"; do
    display_dish "$dish"
    for ingredient in ${dishes[$dish]}; do
      shopping_list+=("$ingredient")
    done
  done

  echo -e "\nShopping List:"
  echo "${shopping_list[@]}" | tr ' ' '\n' | sort -u | while read item; do
    echo "- $item"
  done
}

# Main function
main() {
  local num_days
  while true; do
    read -p "Enter the number of days you need meals prepared for: " num_days
    if ! [[ "$num_days" =~ ^[0-9]+$ ]] || (( num_days <= 0 )); then
      echo "Please enter a valid positive number."
    else
      break
    fi
  done

  get_dishes_for_the_week "$num_days"
}

# Execute the main function
main
