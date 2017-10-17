## bd

[![Travis-CI Build Status](https://travis-ci.org/brechtdv/bd.svg?branch=master)](https://travis-ci.org/brechtdv/bd)

### A suite of helper functions; including utils and summary statistics.

The easiest way to install the `bd` package is via the `devtools` package:

    devtools::install_github("brechtdv/bd")
    library("bd")

#### Available functions

##### Utils

<table>
  <tr>
    <td><code>openwd</code></td>
    <td> Open working directory.</td>
  </tr>
    <tr>
    <td><code>collapse</code></td>
    <td> Collapse elements without separator.</td>
  </tr>
    <tr>
    <td><code>write_cb</code></td>
    <td> Write to Windows clipboard.</td>
  </tr>
    <tr>
    <td><code>read_cb</code></td>
    <td> Read from Windows clipboard.</td>
  </tr>
    <tr>
    <td><code>today</code></td>
    <td> Return today's date in yyyymmdd format.</td>
  </tr>
  <tr>
    <td><code>now</code></td>
    <td> Return current time.</td>
  </tr>
  <tr>
    <td><code>extract_pubmed</code></td>
    <td> Extract data from PubMed file.</td>
  </tr>
  <tr>
    <td><code>convert</code></td>
    <td> Read and save as.</td>
  </tr>
  <tr>
    <td><code>multiplot</code></td>
    <td> Plot multiple ggplot2 objects.</td>
  </tr>
  <tr>
    <td><code>prop_table</code></td>
    <td> Return proportional table.</td>
  </tr>
  </tr>
    <tr>
    <td><code>dropbox</code></td>
    <td> Path to dropbox folder.</td>
  </tr>
  </tr>
    <tr>
    <td><code>github</code></td>
    <td> Path to GitHub folder.</td>
  </tr>
  <tr>
    <td><code>sanitize_specials</code></td>
    <td>Translate special characters to HTML or LaTeX.</td>
  </tr>
  <tr>
    <td><code>html_body</code></td>
    <td>RMarkdown template for HTML body only.</td>
  </tr>
   <tr>
    <td><code>readxl</code></td>
    <td>Read Excel file using <code>readxl</code> package, but save as <code>data.frame</code> instead of <code>tibble</code>.</td>
  </tr>

</table>

##### Summary statistics

<table>
  <tr>
    <td><code>summary_stats</code></td>
    <td> Calculate summary statistics.</td>
  </tr>
  <tr>
    <td><code>mean_ci</code></td>
    <td> Calculate mean and 95% confidence interval.</td>
  </tr>
  <tr>
    <td><code>hpd</code></td>
    <td> Highest posterior density interval.</td>
  </tr>
  <tr>
    <td><code>sem</code></td>
    <td> Calculate standard error of the mean.</td>
  </tr>
  <tr>
    <td><code>cv</code></td>
    <td> Calculate coefficient of variation.</td>
  </tr>
</table>

##### Statistical functions

<table>
  <tr>
    <td><code>logit</code></td>
    <td> Logistic transformation.</td>
  </tr>
  <tr>
    <td><code>expit</code></td>
    <td> Inverse logistic transformation.</td>
  </tr>
  <tr>
    <td><code>rgamma2</code></td>
    <td>Simulate random Gamma deviates with specified mean and standard deviation.</td>
  </tr>
  <tr>
    <td><code>rlnorm2</code></td>
    <td>Simulate random log-normal deviates with specified mean and standard deviation.</td>
  </tr>
</table>
