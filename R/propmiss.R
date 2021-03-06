#' Missing stats
#' 
#' Returns the number of missing values, total length, and proportion
#' missing values for each variable in a data.frame
#' 
#' @author Stephen Turner
#' @keywords keywords
#' 
#' @param df A data.frame object
#' 
#' @return A data.frame with missingness stats
#' 
#' @export
#' 
#' @examples
#' propmiss(data.frame(a=1:5, b=c(6,NA,NA,9,10)))

propmiss <- function(df) {
    m <- sapply(df, function(x) {
        data.frame(
            nmiss=sum(is.na(x)), 
            n=length(x), 
            propmiss=sum(is.na(x))/length(x)
        )
    })
    d <- data.frame(t(m))
    d <- sapply(d, unlist)
    d <- as.data.frame(d)
    d$variable <- row.names(d)
    row.names(d) <- NULL
    d <- cbind(d[ncol(d)],d[-ncol(d)])
    return(d[order(d$propmiss), ])
}