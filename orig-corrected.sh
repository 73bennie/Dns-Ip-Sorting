while read domain; do
  dig +short A "$domain"
done | sort -u
