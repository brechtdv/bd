html_body <-
  function(number_sections = FALSE,
           fig_width = 7,
           fig_height = 5,
           fig_retina = if (!fig_caption) 2,
           fig_caption = FALSE,
           dev = 'png',
           smart = TRUE,
           mathjax = TRUE,
           keep_md = FALSE,
           md_extensions = NULL,
           pandoc_args = NULL,
           ...) {
    
    if (mathjax)
      pandoc_args <- c(pandoc_args, "--mathjax")
    
    rmarkdown::html_document(
      number_sections = number_sections,
      fig_width = fig_width,
      fig_height = fig_height,
      fig_retina = fig_retina,
      fig_caption = fig_caption,
      dev = dev, smart = smart,
      keep_md = keep_md,
      md_extensions = md_extensions,
      pandoc_args = pandoc_args,
      mathjax = NULL,
      highlight = "default", theme = NULL,
      ...,
      template = rmarkdown:::rmarkdown_system_file("rmd/fragment/default.html")
    )
  }