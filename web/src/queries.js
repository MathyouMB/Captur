import { gql } from "apollo-boost";
export const USERS = gql`
{
    users{
      id
      email
      username
    }
  }
`;

export const GAMES = gql`
{
    games{
      id
      title
      description
      startDate
      EndDate
    }
  }
`;