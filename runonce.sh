echo '-------Kickoff the on-demand backup job'
cat <<EOF | kubectl create -f -
apiVersion: actions.kio.kasten.io/v1alpha1
kind: RunAction
metadata:
  generateName: run-backup-
spec:
  subject:
    kind: Policy
    name: k10-postgresql-backup
    namespace: kasten-io
EOF
