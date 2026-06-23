<?php

function mod004_itemsPerPageOptions($baseUrl, $currentItemsPerPage, $label = "items") {
    $options = [8, 16, 50, 100];

    $html = "<div class='itemsPerPageControl'>";
    $html .= "<span>Mostrar: </span>";

    $html .= "<form method='GET'>";

    $html .= "<select name='itemsPerPage' onchange='
                    this.form.firstItem.value=0; 
                    this.form.submit();
                    '>";
    
    foreach ($options as $option) {
        $selected = ($option == $currentItemsPerPage) ? "selected" : "";
        $html .= "<option value='$option' $selected>$option</option>";
    }

    $html .= "</select>";
    $html .= "<input type='hidden' name='firstItem' value='0'>";
    $html .= "</form>";

    $html .= "<span>$label</span>";
    $html .= "</div>";

    return $html;
}

function mod004_controlsPagination($baseUrl, $firstItem, $itemsPerPage, $totalItems, $label = "items") {

    $html = "<div class='pagination_container'>";

    // Info
    $html .= "<div class='pagination_info'>
        Mostrando " . ($firstItem + 1) . " a " . min($firstItem + $itemsPerPage, $totalItems) . " de $totalItems $label
    </div>";

    $currentPage = floor($firstItem / $itemsPerPage) + 1;
    $totalPages = ceil($totalItems / $itemsPerPage);

    $html .= "<div class='pagination_controls'>";

    // Previous
    if ($currentPage > 1) {
        $prev = $firstItem - $itemsPerPage;
        $html .= "<div class='control'>
            <a href='{$baseUrl}&firstItem=$prev&itemsPerPage=$itemsPerPage'>Anterior</a>
        </div>";
    } else {
        $html .= "<div class='control disabled'>Anterior</div>";
    }

    // Pages
    for ($i = 1; $i <= $totalPages; $i++) {
        $start = ($i - 1) * $itemsPerPage;

        if ($i == $currentPage) {
            $html .= "<div class='control page_btn page_btn_current'>$i</div>";
        } else {
            $html .= "<div class='control page_btn'>
                <a href='{$baseUrl}&firstItem=$start&itemsPerPage=$itemsPerPage'>$i</a>
            </div>";
        }
    }

    // Next
    if ($currentPage < $totalPages) {
        $next = $firstItem + $itemsPerPage;
        $html .= "<div class='control'>
            <a href='{$baseUrl}&firstItem=$next&itemsPerPage=$itemsPerPage'>Siguiente</a>
        </div>";
    } else {
        $html .= "<div class='control disabled'>Siguiente</div>";
    }

    $html .= "</div></div>";

    return $html;
}

?>