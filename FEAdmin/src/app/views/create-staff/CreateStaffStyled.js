import styled from 'styled-components';

const Styled = styled.div`
    .btn-add-new {
        height: 32px;
        margin-bottom: 10px;
        background-color: #0d5ac3;
        color: #fff;
    }
    .btn-add-new:hover {
        background-color: #033c89;
        color: #fff;
    }
    .ant-table-thead .ant-table-cell {
        background-color: #373e58;
        color: #fff;
    }
    .set-space-between {
        display: flex;
        justify-content: space-between;
    }
    .anticon-search {
        font-size: 16px;
    }
    .ant-input-wrapper .ant-input {
        height: 32px;
    }
    .ant-select-selector {
        display: flex;
        justify-content: space-between;
    }
    .ant-pagination {
        display: flex;
        justify-content: end;
        margin-top: 10px;
    }

    .createStaff-action {
        display: flex;
        gap: 10px;
        justify-content: center;
    }

    .editFilled-icon,
    .eyeFilled-icon,
    .deleteFilled-icon {
        color: #999;
        font-size: 16px;
        pointer-events: none;
    }

    .editFilled-icon.active {
        color: #0d4ca5;
        pointer-events: auto;
    }

    .eyeFilled-icon.active {
        color: rgb(40, 153, 40);
        pointer-events: auto;
    }

    .deleteFilled-icon.active {
        color: red;
        pointer-events: auto;
    }
`;
export default Styled;
