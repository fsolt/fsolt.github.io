papers <- readLines("~/Documents/Projects/fsolt_quarto/res/add_res/_index.md")[13:27] %>% 
    as_tibble() %>% 
    filter(!is.na(value) & value!="") %>% 
    mutate(value = str_replace(value,
                               '^<a href=(.*) rel="self">(.*)</a> (.*)',
                               "[\\2](\\1) \\3"),
           value = str_replace(value,
                               '^<a href=(.*) rel="self">(.*)</a>(.*)',
                               "[\\2](\\1) \\3"),
           abstract = if_else(str_detect(value, "^\\[?\\w*,"), NA_character_, value)) %>% 
    fill(abstract, .direction = "up") %>% 
    filter(value!=abstract) %>% 
    mutate(abstract = abstract %>% 
               str_replace_all("<br />", ""),
           authors = str_extract(value, "^[^.]*") %>% 
               str_replace("\\[", ""),
           year = str_extract(value, "\\d{4}"),
           journal_pages = str_extract(value, "_[^\\]]*"),
           title = str_extract(value, '(\\"|&ldquo;)[^\\"]*\\"') %>% 
               str_replace("&ldquo;", '"') %>% 
               str_replace(".$", ""),
           title = if_else(is.na(title), str_extract(value, "(?<='').*(?='')"), title),
           title = if_else(str_extract(title, '.')=='"', title, paste0('"', title, '"')),
           url = str_extract(value, '(?<=\\()\\"?(http|/)[^\\)]*'),
           name = str_extract(url, '[^/]*$') %>% 
               str_replace('"', "") %>% 
               str_replace("books.*", "solt2014"),
           cite = paste0(authors, ". ", year, ". ", title, " ", journal_pages),
           preprint_url = str_extract(value, "https?://osf.io/[^/]*/"),
           preprint_url = if_else(is.na(preprint_url),
                                  str_extract(value, "/papers/[^)]*pre"),
                                  preprint_url),
           github_url = str_extract(value, "https?://github.com/fsolt/[^)]*"),
           dataverse_url = str_extract(value, 'https?://[^/]*(doi|handle).*/.+?(?=[\\)"])') %>% 
               str_replace('[\\)"].*', "")) %>% 
    separate(authors, into = paste0("author", 1:6), sep = ", ", fill = "right") %>% 
    mutate(file_output = glue::glue_data(., 
                                        '---
                                        title: {<title>}
                                        date: {<year>}-06-30
                                        cite: >
                                            %{<cite>}%
                                        author:
                                          - name: {<author2>} {<author1>}
                                          - name: {<str_replace(author3, "and ", "")>}
                                          - name: {<str_replace(author4, "and ", "")>}
                                          - name: {<str_replace(author5, "and ", "")>}
                                          - name: {<str_replace(author6, "and ", "")>}
                                        links:
                                          - name: Final version
                                            url: {<url>}
                                            icon: fas fa-scroll
                                          - name: Preprint
                                            url: {<preprint_url>}
                                            icon: far fa-file-pdf
                                          - name: Code
                                            url: {<github_url>}
                                            icon: fa-brands fa-github
                                          - name: Dataverse
                                            url: {<dataverse_url>}
                                            icon: fas fa-table
                                        listing:
                                          - id: cite
                                            contents: "*.qmd"
                                            template: "../../../templates/single-cite.ejs"
                                        categories:
                                            - democracy
                                        ---
                                        
                                        :::{#cite}
                                        :::\
                                        
                                        ## Abstract
                                        {<abstract>}
                                        ',
                                         .open = "{<", .close = ">}") %>% 
               str_replace_all("- NA", "") %>% 
               str_replace_all("%", "'"))
               

 walk2(papers$file_output, papers$name, function(paper, name) {
     dir.create(file.path("res/published", name))
     write(paper, file = file.path("res/published", name, paste0(name, ".qmd")))
 })              

 indices <- list.files("res", pattern = "index.qmd", recursive = TRUE)

 walk(indices, function(ind) {
     file.copy(from = file.path("~/Documents/Projects/fsolt_quarto/res", ind), 
               to = str_replace(file.path("~/Documents/Projects/fsolt_quarto/res", ind), "index", "short"))
})
 