```bash
#!/bin/bash

# Simple Interest Calculator
# Formula: I = PRT (I = Interest, P = Principal, R = Rate as percentage, T = Time in years)

echo "Simple Interest Calculator"
echo "-------------------------"

# Function to validate if input is a positive number
validate_number() {
    local input=$1
    local field=$2
    if ! [[ "$input" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: $field must be a valid number."
        exit 1
    fi
    if (( $(echo "$input <= 0" | bc -l) )); then
        echo "Error: $field must be greater than zero."
        exit 1
    fi
    echo "$input"
}

# Prompt for user input
read -p "Enter Principal Amount: " principal
principal=$(validate_number "$principal" "Principal Amount")

read -p "Enter Annual Interest Rate (%): " rate
rate=$(validate_number "$rate" "Interest Rate")

read -p "Enter Time (in years): " time
time=$(validate_number "$time" "Time")

# Calculate simple interest (I = PRT / 100)
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc -l)

# Calculate total amount (Principal + Interest)
total=$(echo "scale=2; $principal + $interest" | bc -l)

# Format numbers with commas for readability
principal_formatted=$(printf "%.2f" "$principal" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')
interest_formatted=$(printf "%.2f" "$interest" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')
total_formatted=$(printf "%.2f" "$total" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta')

# Display results
echo "-------------------------"
echo "Principal Amount: \$$principal_formatted"
echo "Interest Rate: $rate%"
echo "Time: $time years"
echo "Simple Interest: \$$interest_formatted"
echo "Total Amount: \$$total_formatted"
```
