

if [ $# -ne 1]; then
 echo "usage: $0<log_file_path>"
exit 1
fi
if[! -f "$LOG_File"]; then
echo "Error: File not found!"
exit 1
fi

ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOG_FILE")
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE")

echo -e "\nTop 5 Most Common ERROR Messages:"
grep "ERROR" "$LOG_FILE" | sed -E 's/.*ERROR\s+//' | sort | uniq -c | sort -nr | head -5

# Get first and last ERROR timestamps
FIRST_ERROR=$(grep "ERROR" "$LOG_FILE" | head -1 | grep -oE '^[0-9T: \-]+')
LAST_ERROR=$(grep "ERROR" "$LOG_FILE" | tail -1 | grep -oE '^[0-9T: \-]+')

# Summary report
echo -e "\nSummary Report:"
echo "-----------------------------"
echo "Total ERRORs  : $ERROR_COUNT"
echo "Total WARNINGs: $WARNING_COUNT"
echo "Total INFOs   : $INFO_COUNT"
echo "First ERROR at: $FIRST_ERROR"
echo "Last ERROR at : $LAST_ERROR"
echo "-----------------------------")
