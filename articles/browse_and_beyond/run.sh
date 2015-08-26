# OOTB
bin/solr create -c solr_docs
bin/post -c solr_docs docs/
open http://localhost:8983/solr/solr_docs/browse?q=faceting

# bin/solr start -e techproducts
bin/solr create -c techproducts -d sample_techproducts_configs
bin/post -c techproducts example/exampledocs/*.xml
open http://localhost:8983/solr/techproducts/browse

bin/solr create -c example
bin/post -c example -params "f.tags.split=true" -type text/csv -d $'id,title,tags\n1,first document,A\n2,second document,"A,B"\n3,third document,B'
open http://localhost:8983/solr/example/browse

# Add facet
curl http://localhost:8983/solr/example/config/params -H 'Content-type:application/json'  -d '{
"update" : {
  "facets": {
    "facet.field":"tags"
    }
  }
}'

unzip dist/solr-velocity-5.3.0.jar velocity/*.vm -d server/solr/example/conf/

# Modify header in layout.vm:
#<div id="head">
#  <a href="#url_for_home">
#     <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Twemoji_1f50e.svg/50px-Twemoji_1f50e.svg.png"/>
#  </a>
# </div>


