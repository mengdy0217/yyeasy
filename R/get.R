#' Easy get
#'
#' @rdname get
#'
#' @param filename file path
#' @param lower All lowercase
#'
#' @examples
#' get_ext("123.txt")
#' @export
get_ext <- function(filename, lower = TRUE) {
    ext <- tools::file_ext(filename)
    if (lower == TRUE) ext <- tolower(ext)
    ext
}


#' @rdname get
#' @param df your data
#' @param level significance level
#' @param num display numbers
#'
#' @return Convert significance numbers to ***.
#' Simplified digital display.
#'
#' @examples
#' get_sig(c(-1,0.00001, 0.0001, 0.001, 0.01, 0.04), level = 5)
#' get_corr(c(0.1, 0.5, 06))
#' @export
get_sig <- function(df ,level=3, num = FALSE) {
    ## trans
    df <- as.data.frame(df)
    nr <- nrow(df)
    df <- matrix(as.numeric(as.matrix(df)), nrow = nr)
    df[is.na(df)] <- 1
    df[df == 0] <- 1
    ## get address
    add_0 <- df >= 0.05
    add_1 <- df < 0.05   & df > 0
    add_2 <- df < 0.01   & df > 0
    add_3 <- df < 0.001  & df > 0
    add_4 <- df < 0.0001 & df > 0
    ## show number
    if (num == TRUE) {
        df_new <- matrix(sprintf("%.3f", df), nrow = nr)
        df_new[add_0] <- ""
        return(df_new)
    }
    ## *****
    df[add_0] <- ''
    df[add_1] <- '*'
    if (level == 1) return(df)
    df[add_2] <- '**'
    if (level == 2) return(df)
    df[add_3] <- '***'
    if (level == 3) return(df)
    df[add_4] <- '****'
    if (level == 4) return(df)
    df
}




#' @rdname get
#' @export
#' @param cut Numbers less than this value are omitted.
#'
get_corr <- function(df, cut = 0.3) {
    ## trans
    df <- as.data.frame(df)
    nr <- nrow(df)
    df <- matrix(as.numeric(as.matrix(df)), nrow = nr)
    df[is.na(df)] <- 0
    ## get address
    add_0 <- abs(df) < cut
    ## show number
    df_new <- matrix(sprintf("%.2f", df), nrow = nr)
    df_new[add_0] <- ""
    return(df_new)
}
