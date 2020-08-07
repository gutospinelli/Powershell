function abcfunc ([string]$command){  
    docker run -i --rm -v abc:/root appbaseio/abc "$command"
}
Set-Alias -Name abc -Value abcfunc

function elasticfunc {
	docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.8.1
}

Set-Alias -Name elastic -Value elasticfunc