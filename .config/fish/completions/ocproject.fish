set meep
function __fish_ocproject_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'ocproject' ]
    return 0
  end
  return 1
end
function __fish_ocproject_using_command --no-scope-shadowing
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $meep[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end
set -l me (/usr/bin/ls $HOME/projects)
for com in $me
  set -e meep
  complete -f -c ocproject  -a $com -d "Project Directory"
end
