import { Col, Input } from "antd";
import React from "react";
import { useEffect } from "react";
// import styled from "styled-components";
const { Search } = Input;

const SearchStaff = (props) => {

    const { searchInfo, setSearchInfo, onSearch } = props

    return (
        <>
            <Col span={5}>
                <Search
                    placeholder="search"
                    onChange={(e) => setSearchInfo(e.target.value)}
                    onSearch={onSearch}
                />
            </Col>
        </>
    )
}

export default SearchStaff;
