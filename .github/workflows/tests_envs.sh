# repos=path_repos_${{github.repository}}
test2=test
test=novo
temp_test=$(echo "$test2"_"$test")
test=novo
test_novo=deucerto

repos=$test2$novo
# repos=$test2

valor=$(echo $temp_test)
echo $${valor}